import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:supabase_boilerplate/app/theme/theme_bloc/theme_bloc.dart';
import 'package:supabase_boilerplate/core/services/supabase_service.dart';
import 'package:supabase_boilerplate/features/auth/bloc/auth_bloc.dart';

final sl = GetIt.instance;

bool _supabaseInitialized = false;

Future<void> configureDependencies() async {
  await _initSupabase();

  if (!sl.isRegistered<SupabaseService>()) {
    sl.registerLazySingleton<SupabaseService>(() => SupabaseService());
  }

  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      supabaseService: sl(),
    ),
  );

  if (!sl.isRegistered<ThemeBloc>()) {
    sl.registerFactory<ThemeBloc>(() => ThemeBloc());
  }
}

Future<void> _initSupabase() async {
  if (_supabaseInitialized) {
    return;
  }

  final supabaseUrl = dotenv.env['SUPABASE_URL'];
  final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];

  if (supabaseUrl == null ||
      supabaseUrl.isEmpty ||
      supabaseAnonKey == null ||
      supabaseAnonKey.isEmpty) {
    throw Exception(
      'Please provide SUPABASE_URL and SUPABASE_ANON_KEY in your .env file.',
    );
  }

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );

  _supabaseInitialized = true;
}

