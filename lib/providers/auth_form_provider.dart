import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  bool _isLoading = false;

  // Métodos getters del provider.
  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;

  // Métodos setters del provider.
  set email(String? value) {
    _email = value ?? _email;
    notifyListeners();
  }

  set password(String? value) {
    _password = value ?? _password;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Método que contiene impresión del estado de la validación.
  // bool isValidForm() {
  //   if (kDebugMode) {
  //     print('Resultado Validación: ${formKey.currentState?.validate()}');
  //     print('[$_email - $_password]');
  //   }
  //   return formKey.currentState?.validate() ?? false;
  // }

  bool isValidForm() => formKey.currentState?.validate() ?? false;
}
