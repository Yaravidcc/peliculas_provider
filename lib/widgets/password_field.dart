import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../ui/ui.dart';
import '../utils/utils.dart';

class PasswordField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final String errorMessage;
  final IconData prefixIcon;

  const PasswordField({
    super.key,
    this.hintText = '********',
    this.labelText = 'Contraseña',
    this.errorMessage = 'Error en el formato de la contraseña',
    this.prefixIcon = Icons.lock_outline,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      decoration: InputDecorations.authInputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
      ),
      onChanged: (value) {
        if (kDebugMode) print(value);
      },
      validator: (value) {
        return FormValidators.passwordValidator().hasMatch(value ?? '') ? null : errorMessage;
      },
    );
  }
}
