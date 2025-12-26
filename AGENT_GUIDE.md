# Agent Guide

## Localization

- All user-facing strings **must** live in `lib/l10n/*.arb` and be accessed through `AppLocalizations` (use `context.l10n` from `lib/core/extensions/context_extensions.dart`).
- English is the default language; add/update Spanish (or any future locale) alongside English when introducing new copy.
- Never hardcode Russian (or any other ad-hoc language) text inside widgets, blocs, services, or tests. If a new locale is required, add an ARB file for it.
- After editing ARB files, run `flutter gen-l10n` (or a Flutter command that triggers code generation) and ensure the generated strings are used everywhere.

## Toast Notifications

- Use the centralized helper in `lib/core/widgets/app_toast.dart` for **any** user-facing toast/snackbar.
- Always pass localized titles/messages when calling `AppToast.showSuccess` or `AppToast.showError`.
- Never call `ScaffoldMessenger`/`SnackBar`/`DelightToastBar` directly from feature code—add new variations to `AppToast` if styling must change.
- Wrap action flows (e.g., bloc listeners) and trigger toasts once per user action to avoid duplicates.

## Loading Buttons

- All primary actions must use `LoadingButton` (`lib/core/widgets/loading_button.dart`) or a derivative to avoid duplicate taps and show progress feedback.
- Drive the `isLoading` flag from Bloc/Cubit states so the button disables itself automatically.
- Customize labels, icons, and styles through the widget’s props instead of creating one-off button implementations.
- If a new button variant is needed, extend `LoadingButton` rather than creating bespoke `ElevatedButton` code.

### Example Usage

```dart
BlocListener<AuthBloc, AuthState>(
  listener: (context, state) {
    if (state is AuthAuthenticated) {
      AppToast.showSuccess(
        context,
        title: context.l10n.toastSuccessTitle,
        message: context.l10n.toastLoginSuccess,
      );
    } else if (state is AuthError) {
      AppToast.showError(
        context,
        title: context.l10n.toastErrorTitle,
        message: state.message,
      );
    }
  },
  child: const LoginForm(),
);
```

> When introducing new features, document any non-standard messaging in this file and keep `AppToast` as the single entry point. Always add the relevant strings to `lib/l10n/*.arb` and ensure buttons rely on `LoadingButton`.

