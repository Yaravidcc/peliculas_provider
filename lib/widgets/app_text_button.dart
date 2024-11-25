import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool transparent;
  final Color backgroundColor = AppTheme.appTheme.primaryColor;
  final Color overlayColor = AppTheme.appTheme.primaryColorDark;

  AppTextButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.transparent = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: !transparent
          ? ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(backgroundColor),
              overlayColor: WidgetStateProperty.all(overlayColor),
              shape: WidgetStateProperty.all(const StadiumBorder()),
            )
          : null,
      child: child,
    );
  }
}
