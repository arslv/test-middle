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

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Отключаем логи FlutterError в консоли
  FlutterError.onError = (FlutterErrorDetails details) {
    // В продакшене можно добавить сервис для логирования ошибок
    if (kDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    }
  };
  
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
        title: 'Gallery App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'PressStart2P',
        ),
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRoutes.getRoute,
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
