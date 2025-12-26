import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:supabase_boilerplate/core/extensions/context_extensions.dart';
import 'package:supabase_boilerplate/core/widgets/app_toast.dart';
import 'package:supabase_boilerplate/core/widgets/loading_button.dart';
import 'package:supabase_boilerplate/features/auth/bloc/auth_bloc.dart';
import 'package:supabase_boilerplate/features/auth/bloc/auth_event.dart';
import 'package:supabase_boilerplate/features/auth/bloc/auth_state.dart';
import 'package:supabase_boilerplate/features/auth/ui/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static const routePath = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.signupTitle)),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
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
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        labelText: context.l10n.signupFirstNameLabel,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.l10n.signupFirstNameEmpty;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        labelText: context.l10n.signupLastNameLabel,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: context.l10n.signupEmailLabel,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.l10n.signupEmailEmpty;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: context.l10n.signupPasswordLabel,
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return context.l10n.signupPasswordTooShort;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        final isLoading = state is AuthLoading;
                        return LoadingButton(
                          label: context.l10n.signupButton,
                          isLoading: isLoading,
                          onPressed: _onSignupPressed,
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () => context.go(LoginPage.routePath),
                      child: Text(context.l10n.signupNavigateToLogin),
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

  void _onSignupPressed() {
    if (!_formKey.currentState!.validate()) return;

    context.read<AuthBloc>().add(
          AuthSignUpRequested(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
            firstName: _firstNameController.text.trim(),
            lastName: _lastNameController.text.trim(),
          ),
        );
  }
}

