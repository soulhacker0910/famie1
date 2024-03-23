//file:screenlimit.dart
import 'package:flutter/material.dart';
import 'home.dart';
import 'main.dart';

class ScreenTimeLimitScreen extends StatelessWidget {
  const ScreenTimeLimitScreen({super.key});
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: Image.asset(
          'assets/image2.png',
          height: 40.0,
          fit: BoxFit.cover,
        ),
        centerTitle: true,
       actions: [
          IconButton(
            icon: const Icon(Icons.home),
            color: Colors.black,
            onPressed: () {
              // Navigate to the HomeScreen
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (Route<dynamic> route) => false,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            color: Colors.black,
            onPressed: () {
              // Navigate back to the MainScreen (login screen)
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Time Limit Setting Form Goes Here'),
      ),
    );
  }
}
