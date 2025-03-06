import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:midtest/gen/assets.gen.dart';
import '../../../../core/navigation/navigation_extension.dart';
import '../../../../core/navigation/app_routes.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../auth/bloc/auth_bloc.dart';
import '../../presentation/bloc/gallery_bloc.dart';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';
import '../../../../core/services/network_service.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  bool _isOffline = false;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    
    // Проверяем реальное соединение
    NetworkService.isInternetAvailable().then((hasInternet) {
      setState(() {
        _isOffline = !hasInternet;
      });
      
      if (hasInternet) {
        context.read<GalleryBloc>().add(const GalleryEvent.initialized());
      }
    });
    
    // Подписываемся на изменения статуса соединения
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((result) {
      if (result != ConnectivityResult.none) {
        // Дополнительно проверяем реальное соединение
        NetworkService.isInternetAvailable().then((hasInternet) {
          setState(() {
            _isOffline = !hasInternet;
          });
          
          if (hasInternet && _isOffline) {
            context.read<GalleryBloc>().add(const GalleryEvent.initialized());
          }
        });
      } else {
        setState(() {
          _isOffline = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  void _onLogoutPressed() {
    context.read<AuthBloc>().add(const AuthEvent.signOutRequested());
    context.pushReplacementNamed(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    // Показываем уведомление если нет соединения
    if (_isOffline) {
      return Scaffold(
        backgroundColor: const Color(0xFF1F1F1F),
        appBar: CustomAppBar(
          title: 'Галерея',
          prefix: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: _onLogoutPressed,
            child: SvgPicture.asset(Assets.vector.logout.path),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.signal_wifi_off, size: 64, color: Colors.white70),
              SizedBox(height: 16),
              Text(
                'Нет подключения к интернету',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 24),
              CupertinoButton(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                color: Color(0xFF8924E7),
                child: Text('Повторить'),
                onPressed: () {
                  Connectivity().checkConnectivity().then((result) {
                    setState(() {
                      _isOffline = result == ConnectivityResult.none;
                      if (!_isOffline) {
                        context.read<GalleryBloc>().add(const GalleryEvent.initialized());
                      }
                    });
                  });
                },
              ),
            ],
          ),
        ),
      );
    }
    
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      appBar: CustomAppBar(
        title: 'Галерея',
        prefix: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: _onLogoutPressed,
          child: SvgPicture.asset(Assets.vector.logout.path),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.background.image().image,
            fit: BoxFit.cover,
          ),
        ),
        child: BlocBuilder<GalleryBloc, GalleryState>(
          builder: (context, state) {
            return Stack(
              children: [
                state.maybeMap(
                  loadSuccess: (state) {
                    if (state.images.isEmpty) {
                      return Center(
                        child: Text(
                          'Нет загруженных изображений',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }

                    return GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1,
                      ),
                      itemCount: state.images.length,
                      itemBuilder: (context, index) {
                        final image = state.images[index];
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: MemoryImage(base64Decode(image.imageData)),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  loading: (_) => const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                  loadFailure: (state) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.error_outline, size: 64, color: Colors.white70),
                          SizedBox(height: 16),
                          Text(
                            state.message,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 24),
                          CupertinoButton(
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            color: Color(0xFF8924E7),
                            child: Text('Повторить'),
                            onPressed: () {
                              context.read<GalleryBloc>().add(const GalleryEvent.initialized());
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  orElse: () => const SizedBox(),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 24,
                  child: CustomButton(
                    text: 'Создать',
                    onPressed: () => context.pushNamed(AppRoutes.createImage),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
