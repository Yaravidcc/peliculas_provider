import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../utils/form_validators.dart';

import '../ui/ui.dart';

class EmailField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final String errorMessage;
  final IconData prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;

  const EmailField({
    super.key,
    this.hintText = 'usuario@ipn.mx',
    this.labelText = 'E-mail',
    this.errorMessage = 'El formato del correo es inválido',
    this.prefixIcon = Icons.mail_lock,
    this.validator,
    this.onChanged,
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
      validator: validator ?? (value) => FormValidators.emailValidator().hasMatch(value ?? '') ? null : errorMessage,
      onChanged: onChanged,
    );
  }
}
