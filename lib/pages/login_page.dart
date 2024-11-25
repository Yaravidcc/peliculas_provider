import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  static String routeName = 'login_page';
  static String titleScreen = 'Ingresar';
  const LoginPage({super.key});

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
                    _widgetButtonIngresar(context),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              _widgetCrearCuenta(context, false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _widgetButtonIngresar(BuildContext context) {
    return AppFilledButton(
      onPressed: () => _onClickButtonIngresar(context),
      color: Theme.of(context).colorScheme.primary,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        child: const Text('Ingresar', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _widgetCrearCuenta(BuildContext context, bool transparent) {
    return AppTextButton(
      onPressed: () => Navigator.pushReplacementNamed(context, RegisterPage.routeName),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        child: Text('Crear una nueva cuenta', style: TextStyle(fontSize: 18, color: AppTheme.appTheme.canvasColor)),
      ),
    );
  }

  _onClickButtonIngresar(BuildContext context) {
    // Ocultar el teclado.
    FocusScope.of(context).unfocus();
    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }
}
