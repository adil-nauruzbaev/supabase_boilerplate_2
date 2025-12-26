import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import 'package:supabase_boilerplate/features/auth/bloc/auth_bloc.dart';
import 'package:supabase_boilerplate/features/auth/bloc/auth_state.dart';
import 'package:supabase_boilerplate/features/auth/ui/home_page.dart';
import 'package:supabase_boilerplate/features/auth/ui/login_page.dart';
import 'package:supabase_boilerplate/features/auth/ui/signup_page.dart';

class AppRouter {
  AppRouter({required this.authBloc}) {
    router = GoRouter(
      initialLocation: LoginPage.routePath,
      refreshListenable: _GoRouterRefreshStream(authBloc.stream),
      redirect: (context, state) {
        final isAuthenticated = authBloc.state is AuthAuthenticated;
        final targetPath = state.fullPath ?? state.uri.path;
        final isLogging = targetPath == LoginPage.routePath ||
            targetPath == SignupPage.routePath;

        if (!isAuthenticated && !isLogging) {
          return LoginPage.routePath;
        }

        if (isAuthenticated && isLogging) {
          return HomePage.routePath;
        }

        return null;
      },
      routes: [
        GoRoute(
          path: LoginPage.routePath,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: SignupPage.routePath,
          builder: (context, state) => const SignupPage(),
        ),
        GoRoute(
          path: HomePage.routePath,
          builder: (context, state) => const HomePage(),
        ),
      ],
    );
  }

  final AuthBloc authBloc;
  late final GoRouter router;
}

class _GoRouterRefreshStream extends ChangeNotifier {
  _GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

