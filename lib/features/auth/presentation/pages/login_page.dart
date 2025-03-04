import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midtest/core/widgets/custom_text_field.dart';
import 'package:midtest/core/widgets/glow_text_widget.dart';
import '../../../../core/navigation/navigation_extension.dart';
import '../../../../core/navigation/app_routes.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  double get height => MediaQuery.of(context).size.height;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(
            AuthEvent.signInRequested(
              email: _emailController.text,
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.mapOrNull(
            authenticated: (_) =>
                context.pushReplacementNamed(AppRoutes.gallery),
            failure: (state) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            ),
          );
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black.withOpacity(0.5),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.3),
                      GlowText(text: 'Вход'),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: _emailController,
                        placeholder: 'Введите электронную почту',
                        title: 'e-mail',
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: _passwordController,
                        placeholder: 'Введите парль',
                        title: 'Подтверждение  пароля',
                        obscureText: true,
                      ),
                      SizedBox(height: height * 0.2),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              CustomButton(
                                text: 'Войти',
                                onPressed: _onLoginPressed,
                                isLoading: state.maybeMap(
                                  loading: (_) => true,
                                  orElse: () => false,
                                ),
                              ),
                              const SizedBox(height: 16),
                              CustomButton(
                                text: 'Регистрация',
                                onPressed: () =>
                                    context.pushNamed(AppRoutes.register),
                                backgroundColor: CupertinoColors.white,
                                textColor: CupertinoColors.black,
                                isOutlined: true,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
