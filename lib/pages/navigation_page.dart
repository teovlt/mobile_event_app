import 'package:app/pages/profile_page.dart';
import 'package:app/services/auth_service.dart';
import 'package:app/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late Future<Map<String, dynamic>> userFuture;
  int index = 0;
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    userFuture = UserService().getUser(FirebaseAuth.instance.currentUser!.uid);
  }

  _signOut() async {
    try {
      final message = await authService.signOut();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.redAccent,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: userFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error loading user: ${snapshot.error}')),
          );
        }

        if (!snapshot.hasData) {
          return const Scaffold(body: Center(child: Text('User not found')));
        }

        final user = snapshot.data!;

        List<Widget> pages = [
          const Center(child: Text('Home')),
          const Center(child: Text('Events')),
          ProfilePage(user: user),
        ];

        return Scaffold(
          appBar: AppBar(
            title: const Text('Mobile Event App'),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: _signOut,
              ),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: index,
            onDestinationSelected: (int newValue) {
              setState(() {
                index = newValue;
              });
            },
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: "Home"),
              NavigationDestination(icon: Icon(Icons.event), label: "Events"),
              NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
          body: pages[index],
        );
      },
    );
  }
}
