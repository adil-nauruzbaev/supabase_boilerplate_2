// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Plantilla de Supabase';

  @override
  String get loginTitle => 'Iniciar sesión';

  @override
  String get loginEmailLabel => 'Correo electrónico';

  @override
  String get loginEmailEmpty => 'Introduce tu correo electrónico';

  @override
  String get loginPasswordLabel => 'Contraseña';

  @override
  String get loginPasswordTooShort =>
      'La contraseña debe tener al menos 6 caracteres';

  @override
  String get loginButton => 'Iniciar sesión';

  @override
  String get loginNavigateToSignup => '¿No tienes cuenta? Regístrate';

  @override
  String get signupTitle => 'Crear cuenta';

  @override
  String get signupFirstNameLabel => 'Nombre';

  @override
  String get signupFirstNameEmpty => 'Introduce tu nombre';

  @override
  String get signupLastNameLabel => 'Apellido';

  @override
  String get signupEmailLabel => 'Correo electrónico';

  @override
  String get signupEmailEmpty => 'Introduce tu correo electrónico';

  @override
  String get signupPasswordLabel => 'Contraseña';

  @override
  String get signupPasswordTooShort =>
      'La contraseña debe tener al menos 6 caracteres';

  @override
  String get signupButton => 'Crear cuenta';

  @override
  String get signupNavigateToLogin => '¿Ya tienes cuenta? Inicia sesión';

  @override
  String welcomeMessage(String fullName) {
    return 'Bienvenido, $fullName';
  }

  @override
  String get signOutButton => 'Cerrar sesión';

  @override
  String get goToLoginButton => 'Ir a inicio de sesión';

  @override
  String get toastLoginSuccess => 'Has iniciado sesión correctamente';

  @override
  String get toastLogoutSuccess => 'Has cerrado sesión correctamente';

  @override
  String get toastSuccessTitle => 'Éxito';

  @override
  String get toastErrorTitle => 'Error';
}
