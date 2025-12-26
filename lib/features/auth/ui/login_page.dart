import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:supabase_boilerplate/core/extensions/context_extensions.dart';
import 'package:supabase_boilerplate/core/widgets/app_toast.dart';
import 'package:supabase_boilerplate/core/widgets/loading_button.dart';
import 'package:supabase_boilerplate/features/auth/bloc/auth_bloc.dart';
import 'package:supabase_boilerplate/features/auth/bloc/auth_event.dart';
import 'package:supabase_boilerplate/features/auth/bloc/auth_state.dart';
import 'package:supabase_boilerplate/features/auth/ui/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routePath = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _signInSubmitted = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.loginTitle)),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated && _signInSubmitted) {
            _signInSubmitted = false;
            AppToast.showSuccess(
              context,
              title: context.l10n.toastSuccessTitle,
              message: context.l10n.toastLoginSuccess,
            );
          } else if (state is AuthError) {
            _signInSubmitted = false;
            AppToast.showError(
              context,
              title: context.l10n.toastErrorTitle,
              message: state.message,
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: context.l10n.loginEmailLabel,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.l10n.loginEmailEmpty;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: context.l10n.loginPasswordLabel,
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return context.l10n.loginPasswordTooShort;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        final isLoading = state is AuthLoading;
                        return LoadingButton(
                          label: context.l10n.loginButton,
                          isLoading: isLoading,
                          onPressed: _onLoginPressed,
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () => context.go(SignupPage.routePath),
                      child: Text(context.l10n.loginNavigateToSignup),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onLoginPressed() {
    if (!_formKey.currentState!.validate()) return;

    _signInSubmitted = true;
    context.read<AuthBloc>().add(
      AuthSignInRequested(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ),
    );
  }
}
