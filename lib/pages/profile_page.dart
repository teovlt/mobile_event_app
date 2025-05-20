import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final Map<String, dynamic> user;

  const ProfilePage({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // No AppBar here as requested
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(user['email']!), // Displaying user email
            const SizedBox(height: 20),
            Text(user['name']!), // Displaying user name
            const SizedBox(height: 20),
            Text(user['surname']!), // Displaying user surname
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
