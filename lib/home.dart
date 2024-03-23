//file:home.dart

import 'package:flutter/material.dart';
import 'child_reg.dart';
import 'main.dart'; 
import 'dashboard.dart'; 
import 'screentimelimit.dart';
import 'theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: Padding(
           padding: appMargin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hi Parent!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
                fontFamily: 'Georgia',
              ),
            ),
            const SizedBox(height: 15),
            MenuItem(
              iconData: Icons.person_add,
              title: 'Register Child',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ChildRegistrationScreen()));
              },
            ),
            MenuItem(
              iconData: Icons.dashboard,
              title: 'Dashboard',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
              },
            ),
            MenuItem(
              iconData: Icons.timer,
              title: 'Set Time Limit',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenTimeLimitScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  const MenuItem({
    super.key,
    required this.iconData,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(iconData, color: Colors.green),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Georgia',
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 8, 8, 8),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
