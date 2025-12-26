import 'package:flutter/material.dart';

/// A reusable button with a built-in loading state to prevent double taps.
class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
    this.style,
    this.progressIndicatorColor,
    this.expand = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Widget? icon;
  final ButtonStyle? style;
  final Color? progressIndicatorColor;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final content = _buildContent(context);

    final button = ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: style,
      child: content,
    );

    if (expand) {
      return SizedBox(width: double.infinity, child: button);
    }
    return button;
  }

  Widget _buildContent(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            progressIndicatorColor ?? Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon!,
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

    return Text(label, textAlign: TextAlign.center);
  }
}

