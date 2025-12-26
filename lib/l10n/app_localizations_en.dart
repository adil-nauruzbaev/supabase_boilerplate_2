// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Supabase Boilerplate';

  @override
  String get loginTitle => 'Log In';

  @override
  String get loginEmailLabel => 'Email';

  @override
  String get loginEmailEmpty => 'Please enter your email';

  @override
  String get loginPasswordLabel => 'Password';

  @override
  String get loginPasswordTooShort => 'Password must be at least 6 characters';

  @override
  String get loginButton => 'Log In';

  @override
  String get loginNavigateToSignup => 'Don\'t have an account? Sign up';

  @override
  String get signupTitle => 'Sign Up';

  @override
  String get signupFirstNameLabel => 'First name';

  @override
  String get signupFirstNameEmpty => 'Please enter your first name';

  @override
  String get signupLastNameLabel => 'Last name';

  @override
  String get signupEmailLabel => 'Email';

  @override
  String get signupEmailEmpty => 'Please enter your email';

  @override
  String get signupPasswordLabel => 'Password';

  @override
  String get signupPasswordTooShort => 'Password must be at least 6 characters';

  @override
  String get signupButton => 'Create account';

  @override
  String get signupNavigateToLogin => 'Already have an account? Log in';

  @override
  String welcomeMessage(String fullName) {
    return 'Welcome, $fullName';
  }

  @override
  String get signOutButton => 'Sign out';

  @override
  String get goToLoginButton => 'Go to login';

  @override
  String get toastLoginSuccess => 'You signed in successfully';

  @override
  String get toastLogoutSuccess => 'You signed out successfully';

  @override
  String get toastSuccessTitle => 'Success';

  @override
  String get toastErrorTitle => 'Error';
}
