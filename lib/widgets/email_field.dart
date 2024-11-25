import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../utils/form_validators.dart';

import '../ui/ui.dart';

class EmailField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final String errorMessage;
  final IconData prefixIcon;

  const EmailField({
    super.key,
    this.hintText = 'usuario@ipn.mx',
    this.labelText = 'E-mail',
    this.errorMessage = 'El formato del correo es inválido',
    this.prefixIcon = Icons.mail_lock,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecorations.authInputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
      ),
      onChanged: (value) {
        if (kDebugMode) print(value);
      },
      validator: (value) {
        return FormValidators.emailValidator().hasMatch(value ?? '') ? null : errorMessage;
      },
    );
  }
}
