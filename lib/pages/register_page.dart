import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';
import 'pages.dart';

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
                      const _RegisterForm(),
                    ],
                  ),
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

  Widget _widgetIngresar(BuildContext context, bool transparent) {
    return AppTextButton(
      onPressed: () => Navigator.pushReplacementNamed(context, LoginPage.routeName),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        child: Text('Ya tengo una cuenta', style: TextStyle(fontSize: 18, color: AppTheme.appTheme.canvasColor)),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

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
          _widgetConfirmPassword(context),
          const SizedBox(height: 30),
          _widgetButtonRegistrar(context),
        ],
      ),
    );
  }

  Widget _widgetConfirmPassword(BuildContext context) {
    final authForm = Provider.of<AuthFormProvider>(context, listen: false);
    const String errorMessage = 'Las contraseñas no coinciden';

    return PasswordField(
      hintText: 'Confirme la contraseña anterior',
      labelText: 'Confirmar Contraseña',
      errorMessage: errorMessage,
      validator: (val) => (val != null ? ((val == authForm.password) ? null : errorMessage) : errorMessage),
    );
  }

  Widget _widgetButtonRegistrar(BuildContext context) {
    final authForm = Provider.of<AuthFormProvider>(context);

    return AppFilledButton(
      onPressed: authForm.isLoading ? null : () async => await _onClickButtonRegistrar(context),
      color: AppTheme.appTheme.primaryColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        child: const Text('Registrar', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  _onClickButtonRegistrar(BuildContext context) async {
    final authForm = Provider.of<AuthFormProvider>(context, listen: false);
    final authFirebase = Provider.of<AuthFirebaseProvider>(context, listen: false);
    final String? errorMessage;

    // Ocultar el teclado.
    FocusScope.of(context).unfocus();
    if (!authForm.isValidForm()) return;
    authForm.isLoading = true;

    errorMessage = await authFirebase.createUser(authForm.email, authForm.password);
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
