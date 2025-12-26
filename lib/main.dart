import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:supabase_boilerplate/l10n/app_localizations.dart';

import 'package:supabase_boilerplate/app/di/injection_container.dart';
import 'package:supabase_boilerplate/app/router/app_router.dart';
import 'package:supabase_boilerplate/app/theme/dark_theme.dart';
import 'package:supabase_boilerplate/app/theme/light_theme.dart';
import 'package:supabase_boilerplate/app/theme/theme_bloc/theme_bloc.dart';
import 'package:supabase_boilerplate/app/theme/theme_bloc/theme_state.dart';
import 'package:supabase_boilerplate/features/auth/bloc/auth_bloc.dart';
import 'package:supabase_boilerplate/features/auth/bloc/auth_event.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await configureDependencies();

  runApp(const SupabaseBoilerplateApp());
}

class SupabaseBoilerplateApp extends StatefulWidget {
  const SupabaseBoilerplateApp({super.key});

  @override
  State<SupabaseBoilerplateApp> createState() =>
      _SupabaseBoilerplateAppState();
}

class _SupabaseBoilerplateAppState extends State<SupabaseBoilerplateApp> {
  late final AuthBloc _authBloc =
      sl<AuthBloc>()..add(const AuthStatusChecked());
  late final ThemeBloc _themeBloc = sl<ThemeBloc>();
  late final AppRouter _appRouter = AppRouter(authBloc: _authBloc);

  @override
  void dispose() {
    _authBloc.close();
    _themeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>.value(value: _authBloc),
        BlocProvider<ThemeBloc>.value(value: _themeBloc),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Supabase Boilerplate',
            onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
            theme: buildLightTheme(),
            darkTheme: buildDarkTheme(),
            themeMode: state.themeMode,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            localeResolutionCallback: (locale, supportedLocales) {
              if (locale == null) return supportedLocales.first;
              for (final supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale.languageCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            routerConfig: _appRouter.router,
          );
        },
      ),
    );
  }
}
