import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class InputDecorations {
  static BorderSide _formFieldBorderSide() {
    return BorderSide(
      color: AppTheme.appTheme.primaryColor,
      width: 2,
    );
  }

  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    required IconData? prefixIcon,
  }) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(borderSide: _formFieldBorderSide()),
      focusedBorder: UnderlineInputBorder(borderSide: _formFieldBorderSide()),
      hintText: hintText,
      labelText: labelText,
      prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: AppTheme.appTheme.primaryColor) : null,
    );
  }
}
