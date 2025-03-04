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
import '../../../../core/services/storage_service.dart';
import '../../../../core/di/service_locator.dart';

class CreateImagePage extends StatefulWidget {
  const CreateImagePage({super.key});

  @override
  State<CreateImagePage> createState() => _CreateImagePageState();
}

class _CreateImagePageState extends State<CreateImagePage> {
  late PainterController _controller;
  Color _selectedColor = Colors.black;
  bool _isErasing = false;
  final _storageService = getIt<StorageService>();
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
      // Получаем размер контейнера для корректного рендера
      final renderSize = context.size ?? const Size(800, 600);
      final image = await _controller.renderImage(renderSize);
      
      if (image != null) {
        // Конвертируем изображение в bytes
        final byteData = await image.toByteData(format: ImageByteFormat.png);
        if (byteData == null) return;
        
        final imageBytes = byteData.buffer.asUint8List();
        
        // Генерируем уникальное имя файла
        final fileName = 'drawing_${DateTime.now().millisecondsSinceEpoch}';
        
        // Загружаем в Storage
        final imageUrl = await _storageService.uploadImage(imageBytes, fileName);
        
        if (imageUrl != null) {
          // Получаем данные текущего пользователя
          final user = _auth.currentUser;
          if (user == null) return;
          
          // Сохраняем в Firestore через bloc
          context.read<GalleryBloc>().add(
                GalleryEvent.imageUploadRequested(
                  name: fileName,
                  imageUrl: imageUrl,
                  authorId: user.uid,
                  authorName: user.email ?? 'Unknown',
                ),
              );
              
          // Возвращаемся на галерею
          context.pushReplacementNamed(AppRoutes.gallery);
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка при сохранении: $e')),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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