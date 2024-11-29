import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';
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
                  create: (context) => AuthFormProvider(),
                  builder: (context, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Text(titleScreen, style: const TextStyle(fontSize: 30)),
                      const SizedBox(height: 20),
                      const _LoginForm(),
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

  Widget _widgetCrearCuenta(BuildContext context, bool transparent) {
    return AppTextButton(
      onPressed: () => Navigator.pushReplacementNamed(context, RegisterPage.routeName),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        child: Text(
          'Crear una nueva cuenta',
          style: TextStyle(
            fontSize: 18,
            color: AppTheme.appTheme.canvasColor,
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final authForm = Provider.of<AuthFormProvider>(context);

    return Form(
      key: authForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          EmailField(onChanged: (value) => authForm.email = value),
          const SizedBox(height: 30),
          PasswordField(onChanged: (value) => authForm.password = value),
          const SizedBox(height: 30),
          _widgetButtonIngresar(context),
        ],
      ),
    );
  }

  Widget _widgetButtonIngresar(BuildContext context) {
    final authForm = Provider.of<AuthFormProvider>(context);

    return AppFilledButton(
      onPressed: authForm.isLoading ? null : () async => await _onClickButtonIngresar(context),
      color: AppTheme.appTheme.primaryColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        child: const Text('Ingresar', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Future<void> _onClickButtonIngresar(BuildContext context) async {
    final authForm = Provider.of<AuthFormProvider>(context, listen: false);
    final authFirebase = Provider.of<AuthFirebaseProvider>(context, listen: false);
    final String? errorMessage;

    // Ocultar el teclado.
    FocusScope.of(context).unfocus();
    if (!authForm.isValidForm()) return;

    authForm.isLoading = true;
    errorMessage = await authFirebase.loginUser(authForm.email, authForm.password);
    if (errorMessage != null) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
      }
      authForm.isLoading = false;
      return;
    }
    // Agregar un delay antes de la transición a la otra página.
    await Future.delayed(const Duration(seconds: 1));
    authForm.isLoading = false;
    if (context.mounted) Navigator.pushReplacementNamed(context, HomePage.routeName);
  }
}
