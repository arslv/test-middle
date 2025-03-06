import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_painter_v2/flutter_painter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../../../../core/navigation/navigation_extension.dart';
import '../../../../core/navigation/app_routes.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../gen/assets.gen.dart';
import '../../presentation/bloc/gallery_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/di/service_locator.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';
import '../../../../core/services/network_service.dart';

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

  @override
  void initState() {
    super.initState();
    _controller = PainterController()..freeStyleStrokeWidth = 3.0;
      // ..thickness = 3.0
      // ..backgroundColor = Colors.white;
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

  void _saveImage() async {
    try {
      // Проверяем реальное соединение с интернетом
      final hasInternet = await NetworkService.isInternetAvailable();
      if (!hasInternet) {
        _showNoConnectionDialog();
        return;
      }

      final renderSize = context.size ?? const Size(800, 600);
      final image = await _controller.renderImage(renderSize);
      
      if (image != null) {
        final byteData = await image.toByteData(format: ImageByteFormat.png);
        if (byteData == null) return;
        
        final imageBytes = byteData.buffer.asUint8List();
        final user = _auth.currentUser;
        if (user == null) return;

        // Показываем индикатор загрузки
        if (!mounted) return;
        
        // Используем переменную для отслеживания и безопасно показываем диалог
        bool isLoading = true;
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => WillPopScope(
            onWillPop: () async => false,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
        );

        // Добавляем таймаут, чтобы избежать вечной загрузки
        Future.delayed(const Duration(seconds: 15), () {
          if (isLoading && mounted) {
            // Закрываем диалог если он все еще показан
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Загрузка прервана из-за таймаута. Проверьте соединение.'),
              ),
            );
          }
        });

        // Загружаем изображение
        context.read<GalleryBloc>().add(
          GalleryEvent.imageUploadRequested(
            name: 'drawing_${DateTime.now().millisecondsSinceEpoch}',
            imageBytes: imageBytes,
            authorId: user.uid,
            authorName: user.email ?? 'Unknown',
          ),
        );
        
        // Слушаем результат в отдельном потоке, не полагаясь только на BlocListener
        GalleryState? resultState;
        var completer = Completer<void>();
        
        final subscription = context.read<GalleryBloc>().stream.listen((state) {
          state.maybeMap(
            uploadSuccess: (_) {
              resultState = state;
              completer.complete();
            },
            uploadFailure: (_) {
              resultState = state;
              completer.complete();
            },
            orElse: () {},
          );
        });
        
        // Ждем результата или таймаута
        await completer.future.timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            if (mounted && isLoading) {
              Navigator.of(context).pop(); // Закрываем диалог
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Превышено время ожидания ответа')),
              );
            }
          }
        );
        
        subscription.cancel();
        isLoading = false;
        
        // Обрабатываем результат если он есть
        if (resultState != null && mounted) {
          resultState?.maybeMap(
            uploadSuccess: (_) {
              if (Navigator.canPop(context)) {
                Navigator.of(context).pop(); // Закрываем диалог
              }
              context.pushReplacementNamed(AppRoutes.gallery);
            },
            uploadFailure: (state) {
              if (Navigator.canPop(context)) {
                Navigator.of(context).pop(); // Закрываем диалог
              }
              _showUploadFailureDialog(state.message);
            },
            orElse: () {},
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка при сохранении: $e')),
      );
    }
  }

  void _showNoConnectionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Нет соединения'),
        content: Text('Для загрузки изображения требуется подключение к интернету.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showUploadFailureDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ошибка загрузки'),
        content: Text(
          'Не удалось загрузить изображение в Firestore: $message\n\n'
          'Убедитесь, что у вас есть подключение к интернету.'
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GalleryBloc, GalleryState>(
      listener: (context, state) {
        state.maybeMap(
          uploadSuccess: (_) {
            // Закрываем диалог загрузки
            Navigator.of(context).pop();
            // Переходим на страницу галереи
            context.pushReplacementNamed(AppRoutes.gallery);
          },
          uploadFailure: (state) {
            // Закрываем диалог загрузки
            Navigator.of(context).pop();
            // Показываем ошибку
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Ошибка загрузки'),
                content: Text(
                  'Не удалось загрузить изображение в Firestore: ${state.message}\n\n'
                  'Убедитесь, что у вас есть подключение к интернету.'
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          },
          orElse: () {

          },
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF1F1F1F),
        appBar: CustomAppBar(
          title: 'Новое изображение',
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
        body: Column(
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _ToolButton(
                    icon: Assets.vector.download.path,
                    onPressed: () {
                      // Здесь будет логика загрузки изображения
                    },
                  ),
                  const SizedBox(width: 16),
                  _ToolButton(
                    icon: Assets.vector.pen.path,
                    isSelected: !_isErasing,
                    onPressed: () {
                      setState(() {
                        _isErasing = false;
                        _controller.freeStyleMode = FreeStyleMode.draw;
                        _controller.freeStyleColor = _selectedColor;
                      });
                    },
                  ),
                  const SizedBox(width: 16),
                  _ToolButton(
                    icon: Assets.vector.stick.path,
                    isSelected: _isErasing,
                    onPressed: () {
                      setState(() {
                        _isErasing = true;
                        _controller.freeStyleMode = FreeStyleMode.erase;
                      });
                    },
                  ),
                  const SizedBox(width: 16),
                  _ToolButton(
                    icon: Assets.vector.palitra.path,
                    onPressed: _showColorPicker,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    color: Colors.white,
                    child: FlutterPainter(
                      controller: _controller,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _ToolButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;
  final bool isSelected;

  const _ToolButton({
    required this.icon,
    required this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFF8924E7).withOpacity(0.2)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: CupertinoButton(
        padding: const EdgeInsets.all(8),
        onPressed: onPressed,
        child: SvgPicture.asset(icon),
      ),
    );
  }
} 