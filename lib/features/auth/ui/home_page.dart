import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:supabase_boilerplate/app/theme/theme_bloc/theme_bloc.dart';
import 'package:supabase_boilerplate/app/theme/theme_bloc/theme_event.dart';
import 'package:supabase_boilerplate/core/extensions/context_extensions.dart';
import 'package:supabase_boilerplate/core/widgets/app_toast.dart';
import 'package:supabase_boilerplate/core/widgets/loading_button.dart';
import 'package:supabase_boilerplate/features/auth/bloc/auth_bloc.dart';
import 'package:supabase_boilerplate/features/auth/bloc/auth_event.dart';
import 'package:supabase_boilerplate/features/auth/bloc/auth_state.dart';
import 'package:supabase_boilerplate/features/auth/ui/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routePath = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _signOutRequested = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appTitle),
        actions: [
          IconButton(
            onPressed: () {
              final currentBrightness = Theme.of(context).brightness;
              context.read<ThemeBloc>().add(
                    ThemeToggled(currentBrightness: currentBrightness),
                  );
            },
            icon: const Icon(Icons.brightness_6),
          ),
        ],
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError && _signOutRequested) {
            _signOutRequested = false;
            AppToast.showError(
              context,
              title: context.l10n.toastErrorTitle,
              message: state.message,
            );
          } else if (state is AuthUnauthenticated) {
            if (_signOutRequested) {
              AppToast.showSuccess(
                context,
                title: context.l10n.toastSuccessTitle,
                message: context.l10n.toastLogoutSuccess,
              );
              _signOutRequested = false;
            }
            context.go(LoginPage.routePath);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AuthAuthenticated) {
            final user = state.user;
            final fullName = '${user.firstName} ${user.lastName}'.trim();
            final displayName = fullName.isEmpty ? user.email : fullName;
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(context.l10n.welcomeMessage(displayName)),
                  const SizedBox(height: 8),
                  Text(user.email),
                  const SizedBox(height: 24),
                  LoadingButton(
                    label: context.l10n.signOutButton,
                    isLoading: state is AuthLoading && _signOutRequested,
                    onPressed: () => _onSignOutPressed(context),
                    expand: false,
                  ),
                ],
              ),
            );
          }

          return Center(
            child: ElevatedButton(
              onPressed: () => context.go(LoginPage.routePath),
              child: Text(context.l10n.goToLoginButton),
            ),
          );
        },
      ),
    );
  }

  void _onSignOutPressed(BuildContext context) {
    _signOutRequested = true;
    context.read<AuthBloc>().add(const AuthSignOutRequested());
  }
}

