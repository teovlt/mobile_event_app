import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accueil"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Text('coucou'),
    );
  }
}
