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

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  void initState() {
    super.initState();
    context.read<GalleryBloc>().add(const GalleryEvent.initialized());
  }

  void _onLogoutPressed() {
    context.read<AuthBloc>().add(const AuthEvent.signOutRequested());
    context.pushReplacementNamed(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
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
                              image: NetworkImage(image.imageUrl),
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
