import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/auth_firebase_provider.dart';
import 'package:provider/provider.dart';
import '../pages/pages.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthFirebaseProvider()),
      ],
      child: const PeliculasApp(),
    );
  }
}

class PeliculasApp extends StatelessWidget {
  const PeliculasApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        RegisterPage.routeName: (context) => const RegisterPage(),
        LoginPage.routeName: (context) => const LoginPage(),
      },
      home: const LoginPage(),
    );
  }
}


// class HomePage extends StatelessWidget {
//   final String title;

//   const HomePage({super.key, required this.title});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(title),
//       ),
//       body: const Center(
//         child: Text('HomePage'),
//       ),
//     );
//   }
// }
