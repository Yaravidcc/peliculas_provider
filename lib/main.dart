import 'package:flutter/material.dart';

void main() {
  runApp(const PeliculasApp());
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
      home: const HomePage(title: 'Aplicación Películas'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const Center(
        child: Text('HomePage'),
      ),
    );
  }
}
