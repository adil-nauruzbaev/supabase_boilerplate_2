import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:supabase_boilerplate/core/services/supabase_service.dart';
import 'package:supabase_boilerplate/features/auth/bloc/auth_event.dart';
import 'package:supabase_boilerplate/features/auth/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required SupabaseService supabaseService})
      : _supabaseService = supabaseService,
        super(const AuthInitial()) {
    on<AuthSignUpRequested>(_onSignUpRequested);
    on<AuthSignInRequested>(_onSignInRequested);
    on<AuthSignOutRequested>(_onSignOutRequested);
    on<AuthStatusChecked>(_onStatusChecked);
  }

  final SupabaseService _supabaseService;

  Future<void> _onSignUpRequested(
    AuthSignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final user = await _supabaseService.signUp(
        email: event.email,
        password: event.password,
        firstName: event.firstName,
        lastName: event.lastName,
      );

      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(const AuthUnauthenticated());
      }
    } catch (error) {
      emit(AuthError(error.toString()));
      emit(const AuthUnauthenticated());
    }
  }

  Future<void> _onSignInRequested(
    AuthSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final user = await _supabaseService.signIn(
        email: event.email,
        password: event.password,
      );

      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(const AuthUnauthenticated());
      }
    } catch (error) {
      emit(AuthError(error.toString()));
      emit(const AuthUnauthenticated());
    }
  }

  Future<void> _onSignOutRequested(
    AuthSignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _supabaseService.signOut();
      emit(const AuthUnauthenticated());
    } catch (error) {
      emit(AuthError(error.toString()));
      final currentUser = _supabaseService.getCurrentUser();
      if (currentUser != null) {
        emit(AuthAuthenticated(currentUser));
      } else {
        emit(const AuthUnauthenticated());
      }
    }
  }

  Future<void> _onStatusChecked(
    AuthStatusChecked event,
    Emitter<AuthState> emit,
  ) async {
    final user = _supabaseService.getCurrentUser();
    if (user != null) {
      emit(AuthAuthenticated(user));
    } else {
      emit(const AuthUnauthenticated());
    }
  }
}

