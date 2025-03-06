import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_painter_v2/flutter_painter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/navigation/navigation_extension.dart';
import '../../../../core/navigation/app_routes.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../gen/assets.gen.dart';
import '../../presentation/bloc/gallery_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/di/service_locator.dart';
import 'dart:async';

class CreateImagePage extends StatefulWidget {
  const CreateImagePage({super.key});

  @override
  State<CreateImagePage> createState() => _CreateImagePageState();
}

class _CreateImagePageState extends State<CreateImagePage> {
  late PainterController _controller;
  Color _selectedColor = Colors.black;
  bool _isErasing = false;
  final _auth = getIt<FirebaseAuth>();
  final _imagePicker = ImagePicker();
  bool _hasBackgroundImage = false;
  bool _canUndo = false;
  bool _canRedo = false;
  Timer? _historyCheckTimer;

  @override
  void initState() {
    super.initState();
    _controller = PainterController()
      ..freeStyleStrokeWidth = 3.0
      ..background = const ColorBackgroundDrawable(color: Colors.white);
    
    // Периодически проверяем состояние истории
    _historyCheckTimer = Timer.periodic(const Duration(milliseconds: 200), (_) {
      _updateHistoryState();
    });
  }
  
  @override
  void dispose() {
    _historyCheckTimer?.cancel();
    super.dispose();
  }
  
  void _updateHistoryState() {
    final canUndo = _controller.canUndo;
    final canRedo = _controller.canRedo;
    
    if (canUndo != _canUndo || canRedo != _canRedo) {
      setState(() {
        _canUndo = canUndo;
        _canRedo = canRedo;
      });
    }
  }

  void _showColorPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          padding: const EdgeInsets.all(20),
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: SafeArea(
            child: ColorPicker(
              pickerColor: _selectedColor,
              onColorChanged: (color) {
                setState(() {
                  _selectedColor = color;
                  _isErasing = false;
                  _controller.freeStyleColor = color;
                });
              },
              pickerAreaHeightPercent: 0.7,
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 85,
      );
      
      if (pickedFile != null) {
        final file = File(pickedFile.path);
        final bytes = await file.readAsBytes();
        final image = await decodeImageFromList(bytes);
        
        setState(() {
          _controller.background = ImageBackgroundDrawable(
            image: image,
          );
          _hasBackgroundImage = true;
        });
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Изображение добавлено на холст')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка при загрузке изображения: $e')),
      );
    }
  }

  void _clearBackground() {
    if (_hasBackgroundImage) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Удалить фон?'),
          content: const Text('Вы уверены, что хотите удалить фоновое изображение?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _controller.background = const ColorBackgroundDrawable(color: Colors.white);
                  _hasBackgroundImage = false;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Удалить'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      appBar: CustomAppBar(
        title: 'Создание',
        prefix: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => context.pop(),
          child: SvgPicture.asset(Assets.vector.back.path),
        ),
        suffix: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: _saveImage,
          child: SvgPicture.asset(Assets.vector.accept.path),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.background.image().image,
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FlutterPainter(
                      controller: _controller,
                    ),
                  ),
                ),
              ),
              Container(
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _ToolButton(
                      icon: Icons.undo,
                      onPressed: _canUndo ? () => _controller.undo() : null,
                      tooltip: 'Отменить',
                      isDisabled: !_canUndo,
                    ),
                    _ToolButton(
                      icon: Icons.redo,
                      onPressed: _canRedo ? () => _controller.redo() : null,
                      tooltip: 'Повторить',
                      isDisabled: !_canRedo,
                    ),
                    _ColorButton(
                      color: _selectedColor,
                      isSelected: !_isErasing,
                      onPressed: _showColorPicker,
                    ),
                    _ToolButton(
                      icon: Icons.brush,
                      isSelected: !_isErasing,
                      onPressed: () {
                        setState(() {
                          _isErasing = false;
                          _controller.freeStyleMode = FreeStyleMode.draw;
                        });
                      },
                      tooltip: 'Кисть',
                    ),
                    _ToolButton(
                      icon: Icons.cleaning_services,
                      isSelected: _isErasing,
                      onPressed: () {
                        setState(() {
                          _isErasing = true;
                          _controller.freeStyleMode = FreeStyleMode.erase;
                        });
                      },
                      tooltip: 'Ластик',
                    ),
                    _ToolButton(
                      icon: Icons.image,
                      isSelected: false,
                      onPressed: _pickImage,
                      tooltip: 'Добавить фото',
                    ),
                    _ToolButton(
                      icon: Icons.delete_outline,
                      isSelected: false,
                      onPressed: _clearBackground,
                      isDisabled: !_hasBackgroundImage,
                      tooltip: 'Удалить фон',
                    ),
                  ],
                ),
              ),
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Размер: ',
                      style: TextStyle(color: Colors.white),
                    ),
                    _SliderButton(
                      value: _controller.freeStyleStrokeWidth,
                      min: 1,
                      max: 20,
                      onChanged: (value) {
                        setState(() {
                          _controller.freeStyleStrokeWidth = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveImage() async {
    try {
      final renderSize = context.size ?? const Size(800, 600);
      final image = await _controller.renderImage(renderSize);
      
      if (image != null) {
        final byteData = await image.toByteData(format: ImageByteFormat.png);
        if (byteData == null) {
          _showUploadFailureDialog('Не удалось получить данные изображения');
          return;
        }
        
        final imageBytes = byteData.buffer.asUint8List();
        
        // Получаем текущего пользователя
        final user = _auth.currentUser;
        if (user == null) return;

        // Показываем индикатор загрузки
        if (!mounted) return;
        
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        );

        // Отправляем событие загрузки изображения
        context.read<GalleryBloc>().add(
          GalleryEvent.imageUploadRequested(
            name: 'Рисунок от ${user.displayName ?? user.email ?? 'пользователя'}',
            imageBytes: imageBytes,
            authorId: user.uid,
            authorName: user.displayName ?? user.email ?? 'Неизвестный',
          ),
        );

        // Слушаем состояние блока для обработки результата загрузки
        final completer = Completer<bool>();
        late final StreamSubscription<GalleryState> subscription;
        
        subscription = context.read<GalleryBloc>().stream.listen((state) {
          state.maybeMap(
            uploadSuccess: (_) {
              subscription.cancel();
              completer.complete(true);
            },
            uploadFailure: (_) {
              subscription.cancel();
              completer.complete(false);
            },
            orElse: () {
            },
          );
        });

        final success = await completer.future;
        
        if (!mounted) return;
        
        // Закрываем диалог загрузки
        Navigator.of(context).pop();

        if (success) {
          _showUploadSuccessDialog();
        } else {
          _showUploadFailureDialog('Не удалось загрузить изображение');
        }
      }
    } catch (e) {
      _showUploadFailureDialog('Ошибка: $e');
    }
  }

  void _showUploadFailureDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Ошибка'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showUploadSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Успех'),
        content: Text('Изображение успешно загружено!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.pushReplacementNamed(AppRoutes.gallery);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}

class _ToolButton extends StatelessWidget {
  final dynamic icon;
  final VoidCallback? onPressed;
  final bool isSelected;
  final String tooltip;
  final bool isDisabled;

  const _ToolButton({
    required this.icon,
    this.onPressed,
    this.isSelected = false,
    this.tooltip = '',
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDisabled
        ? Colors.grey
        : isSelected
            ? const Color(0xFF8924E7)
            : Colors.white;

    return Tooltip(
      message: tooltip,
      child: IconButton(
        onPressed: isDisabled ? null : onPressed,
        icon: icon is String
            ? SvgPicture.asset(icon, color: color)
            : Icon(icon, color: color),
        color: color,
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onPressed;

  const _ColorButton({
    required this.color,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? const Color(0xFF8924E7) : Colors.white,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliderButton extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;

  const _SliderButton({
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Slider(
        value: value,
        min: min,
        max: max,
        activeColor: const Color(0xFF8924E7),
        inactiveColor: Colors.grey[700],
        onChanged: onChanged,
      ),
    );
  }
} 