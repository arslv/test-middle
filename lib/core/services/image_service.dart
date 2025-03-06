import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';

class ImageService {
  /// Сжимает изображение и конвертирует его в base64 строку
  Future<String> compressImage(Uint8List bytes, {double maxSize = 500.0}) async {
    try {
      // Декодируем изображение
      final ui.Image image = await decodeImageFromList(bytes);
      
      // Определяем новые размеры, сохраняя пропорции
      double width = image.width.toDouble();
      double height = image.height.toDouble();
      
      if (width > height) {
        if (width > maxSize) {
          height *= maxSize / width;
          width = maxSize;
        }
      } else {
        if (height > maxSize) {
          width *= maxSize / height;
          height = maxSize;
        }
      }

      // Создаем новый recorder для рисования
      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder);
      
      // Рисуем изображение с новыми размерами
      canvas.drawImageRect(
        image,
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
        Rect.fromLTWH(0, 0, width, height),
        Paint()..filterQuality = FilterQuality.medium,
      );
      
      // Создаем новое изображение
      final ui.Image resizedImage = await recorder.endRecording().toImage(
        width.round(),
        height.round(),
      );
      
      // Получаем байты нового изображения
      final ByteData? byteData = await resizedImage.toByteData(
        format: ui.ImageByteFormat.png,
      );
      
      if (byteData == null) throw Exception('Failed to compress image');
      
      // Конвертируем в base64
      return base64Encode(byteData.buffer.asUint8List());
    } catch (e) {
      // Если что-то пошло не так, возвращаем оригинальное изображение в base64
      return base64Encode(bytes);
    }
  }
  
  /// Декодирует base64 строку в Uint8List
  Uint8List? decodeBase64Image(String base64String) {
    try {
      return base64Decode(base64String);
    } catch (e) {
      return null;
    }
  }
} 