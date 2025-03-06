import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  // Проверяет реальное соединение с интернетом, а не только наличие Wi-Fi/мобильных данных
  static Future<bool> isInternetAvailable() async {
    try {
      // Сначала проверяем базовое соединение
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return false;
      }
      
      // Затем проверяем реальный доступ к интернету
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }
} 