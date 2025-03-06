import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';
import '../../features/auth/bloc/auth_bloc.dart';
import '../../features/gallery/data/gallery_repository.dart';
import '../../features/gallery/presentation/bloc/gallery_bloc.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Firebase instances
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  // Services
  getIt.registerSingleton<AuthService>(AuthService(getIt<FirebaseAuth>()));
  getIt.registerSingleton<FirestoreService>(FirestoreService(getIt<FirebaseFirestore>()));

  // Repositories
  getIt.registerSingleton<GalleryRepository>(GalleryRepository(getIt<FirestoreService>()));

  // Blocs
  getIt.registerFactory<AuthBloc>(() => AuthBloc(getIt<AuthService>()));
  getIt.registerFactory<GalleryBloc>(() => GalleryBloc(getIt<GalleryRepository>()));
} 