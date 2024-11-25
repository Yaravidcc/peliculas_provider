import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String routeName = 'home_page';
  static String titleScreen = 'Aplicación Peliculas';

  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(titleScreen),
      ),
      body: const Center(
        child: Text('HomePage'),
      ),
    );
  }
}
