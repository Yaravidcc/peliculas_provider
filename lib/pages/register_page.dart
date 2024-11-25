import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';
import 'home_page.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  static String routeName = 'register_page';
  static String titleScreen = 'Crear Cuenta';
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 150),
              CardContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Text(titleScreen, style: const TextStyle(fontSize: 30)),
                    const SizedBox(height: 20),
                    const EmailField(),
                    const SizedBox(height: 30),
                    const PasswordField(),
                    const SizedBox(height: 30),
                    _widgetButtonRegistrar(context),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              _widgetIngresar(context, false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _widgetButtonRegistrar(BuildContext context) {
    return AppFilledButton(
      onPressed: () => _onClickButtonRegistrar(context),
      color: Theme.of(context).colorScheme.primary,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        child: const Text('Registrar', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _widgetIngresar(BuildContext context, bool transparent) {
    return AppTextButton(
      onPressed: () => Navigator.pushReplacementNamed(context, LoginPage.routeName),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        child: Text('Ya tengo una cuenta', style: TextStyle(fontSize: 18, color: AppTheme.appTheme.canvasColor)),
      ),
    );
  }

  _onClickButtonRegistrar(BuildContext context) {
    // Ocultar el teclado.
    FocusScope.of(context).unfocus();
    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }
}
