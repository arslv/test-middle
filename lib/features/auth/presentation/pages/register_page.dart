import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midtest/gen/assets.gen.dart';
import '../../../../core/navigation/navigation_extension.dart';
import '../../../../core/navigation/app_routes.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/glow_text_widget.dart';
import '../../bloc/auth_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  double get height => MediaQuery.of(context).size.height;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onRegisterPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Пароли не совпадают')),
        );
        return;
      }

      context.read<AuthBloc>().add(
            AuthEvent.signUpRequested(
              email: _emailController.text,
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.background.image().image,
            fit: BoxFit.cover,
          ),
        ),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.mapOrNull(
              authenticated: (_) =>
                  context.pushReplacementNamed(AppRoutes.login),
              failure: (state) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.15),
                  const GlowText(text: 'Регистрация'),
                  const SizedBox(height: 32),
                  CustomTextField(
                    controller: _nameController,
                    placeholder: 'Введите ваше имя',
                    title: 'Имя',
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: _emailController,
                    placeholder: 'Ваша электронная почта',
                    title: 'E-mail',
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: _passwordController,
                    placeholder: '8-16 символов',
                    title: 'Пароль',
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: _confirmPasswordController,
                    placeholder: '8-16 символов',
                    title: 'Подтверждение пароля',
                    obscureText: true,
                  ),
                  const Spacer(),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return CustomButton(
                        text: 'Зарегистрироваться',
                        onPressed: _onRegisterPressed,
                        isLoading: state.maybeMap(
                          loading: (_) => true,
                          orElse: () => false,
                        ),
                        backgroundColor: Colors.white,
                        textColor: const Color(0xFF8924E7),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
