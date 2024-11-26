import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';
import '../providers/login_form_provider.dart';
import 'pages.dart';

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
              const SizedBox(height: 190),
              CardContainer(
                child: ChangeNotifierProvider(
                  create: (context) => LoginFormProvider(),
                  builder: (context, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Text(titleScreen, style: const TextStyle(fontSize: 30)),
                      const SizedBox(height: 20),
                      const _LoginForm(),
                      const SizedBox(height: 30),
                      _widgetButtonIngresar(context),
                    ],
                  ),
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
    final loginForm = Provider.of<LoginFormProvider>(context);

    return AppFilledButton(
      onPressed: loginForm.isLoading ? null : () async => await _onClickButtonIngresar(context),
      color: AppTheme.appTheme.primaryColor,
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

  Future<void> _onClickButtonIngresar(BuildContext context) async {
    final loginForm = Provider.of<LoginFormProvider>(
      context,
      listen: false,
    );

    // Ocultar el teclado.
    FocusScope.of(context).unfocus();
    if (!loginForm.isValidForm()) return;

    loginForm.isLoading = true;
    // Agregar un delay antes de la transición a la otra página.
    await Future.delayed(const Duration(seconds: 2));
    loginForm.isLoading = false;
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          EmailField(),
          SizedBox(height: 30),
          PasswordField(),
        ],
      ),
    );
  }
}
