import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';

/// Centralized toast helper built on top of [delightful_toast].
/// This should be reused across the app to keep notifications consistent.
class AppToast {
  const AppToast._();

  static void showSuccess(
    BuildContext context, {
    required String message,
    String? title,
  }) {
    _show(
      context,
      title: title ?? 'Success',
      message: message,
      icon: Icons.check_circle_rounded,
      background: Theme.of(context).colorScheme.primary,
    );
  }

  static void showError(
    BuildContext context, {
    required String message,
    String? title,
  }) {
    _show(
      context,
      title: title ?? 'Error',
      message: message,
      icon: Icons.error_rounded,
      background: Theme.of(context).colorScheme.error,
    );
  }

  static void _show(
    BuildContext context, {
    required String title,
    required String message,
    required IconData icon,
    required Color background,
  }) {
    DelightToastBar(
      position: DelightSnackbarPosition.top,
      autoDismiss: true,
      builder: (toastContext) => ToastCard(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(message, style: const TextStyle(color: Colors.white70)),
        color: background,
      ),
    ).show(context);
  }
}
