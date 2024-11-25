import 'package:flutter/material.dart';
// import '/theme/app_theme.dart';

class AppFilledButton extends StatelessWidget {
  // Atributos de la clase.
  final VoidCallback? onPressed;
  final Widget child;
  final Color color;

  const AppFilledButton({
    super.key,
    required this.onPressed,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 0,
        backgroundColor: color,
        disabledBackgroundColor: Colors.grey,
      ),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      // disabledColor: Colors.grey,
      // elevation: 0,
      // color: AppTheme.appTheme.primaryColor,
      onPressed: onPressed,
      child: child,
    );
  }
}
