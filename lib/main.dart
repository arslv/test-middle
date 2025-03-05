import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:midtest/features/auth/bloc/auth_bloc.dart';
import 'package:midtest/features/gallery/presentation/bloc/gallery_bloc.dart';
import 'core/di/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midtest/core/navigation/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        theme: ThemeData( //можно бы вынести
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
