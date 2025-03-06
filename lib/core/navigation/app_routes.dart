import 'package:flutter/material.dart';
import 'package:midtest/features/gallery/presentation/pages/gallery_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/gallery/presentation/pages/create_image_page.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String gallery = '/gallery';
  static const String createImage = '/create_image';
  static const String editImage = '/edit_image';

  static PageRoute getRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        // Fade анимация для сплеш экрана
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => 
              const SplashPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 500),
        );

      case login:
        // Слайд справа для логина
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => 
              const LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              )),
              child: child,
            );
          },
        );

      case register:
        // Слайд снизу для регистрации
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const RegisterPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              )),
              child: child,
            );
          },
        );

      case gallery:
        // Fade + Scale анимация для галереи
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const GalleryPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        );

      case createImage:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const CreateImagePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 0.3),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOut,
                )),
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 300),
        );

      // case editImage:
      //   // Rotation + Scale для редактирования
      //   final imageId = settings.arguments as String?;
      //   return PageRouteBuilder(
      //     pageBuilder: (context, animation, secondaryAnimation) =>
      //         EditImagePage(imageId: imageId ?? ''),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       return RotationTransition(
      //         turns: Tween<double>(begin: 0.1, end: 0.0)
      //             .animate(CurvedAnimation(
      //           parent: animation,
      //           curve: Curves.easeOut,
      //         )),
      //         child: ScaleTransition(
      //           scale: Tween<double>(begin: 0.0, end: 1.0)
      //               .animate(CurvedAnimation(
      //             parent: animation,
      //             curve: Curves.easeOut,
      //           )),
      //           child: child,
      //         ),
      //       );
      //     },
      //     transitionDuration: const Duration(milliseconds: 400),
      //   );

      default:
        // Стандартная анимация для неизвестных роутов
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
    }
  }
} 