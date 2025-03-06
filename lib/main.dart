import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:midtest/core/services/auth_service.dart';
import 'package:midtest/core/services/firestore_service.dart';
import 'package:midtest/features/auth/bloc/auth_bloc.dart';
import 'package:midtest/features/gallery/presentation/bloc/gallery_bloc.dart';
import 'core/di/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midtest/core/navigation/app_routes.dart';
import 'features/gallery/presentation/pages/create_image_page.dart';
import 'features/gallery/presentation/pages/edit_image_page.dart';
import 'features/gallery/presentation/pages/gallery_page.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/register_page.dart';
import 'features/splash/presentation/pages/splash_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  setupServiceLocator();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AuthBloc>()),
        BlocProvider(create: (_) => getIt<GalleryBloc>()),
      ],
      child: MaterialApp(
        title: 'Midtest',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF8924E7)),
          useMaterial3: true,
          fontFamily: 'PressStart2P'
        ),
        initialRoute: AppRoutes.splash,
        onGenerateRoute: (settings) => AppRoutes.getRoute(settings),
        routes: {
          AppRoutes.login: (context) => const LoginPage(),
          AppRoutes.register: (context) => const RegisterPage(),
          AppRoutes.gallery: (context) => const GalleryPage(),
          AppRoutes.createImage: (context) => const CreateImagePage(),
          AppRoutes.editImage: (context) => const EditImagePage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Пример использования сервисов
  final authService = getIt<AuthService>();
  final firestoreService = getIt<FirestoreService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
