import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'theme.dart'; // Ensure this is the correct path to your theme.dart
import 'main.dart'; // Ensure this is the correct path to your main.dart

class ParentSignupForm extends StatefulWidget {
  const ParentSignupForm({super.key});
  

  @override
  State<ParentSignupForm> createState() => _ParentSignupFormState();
}

class _ParentSignupFormState extends State<ParentSignupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

void _onSignupPressed() {
  if (_formKey.currentState!.validate()) {
    // Check if passwords match
    if (passwordController.text == confirmPasswordController.text) {
      debugPrint('Signup successful.');
      // Implement the signup logic here
    } else {
      // You can use ScaffoldMessenger to show a SnackBar with this error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/image2.png',
          height: 150.0,
          width: 170.0,
        ),
        centerTitle: true,
      ),
    body: SingleChildScrollView(
      padding: appMargin, // Assuming this is defined in your theme.dart
      child: Form(
        key: _formKey, // Use the form key here
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Georgia',
                  color: Colors.green[700],
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction, // Add this line
                validator: (value) {
                  // Add your validation logic here.
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  } else if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your username',
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a username';
                }
                // Add more specific validation for the username if needed
                return null;
              },
            ),

              const SizedBox(height: 10),
              TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                } else if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                // Add more specific validation for the password if needed
                return null;
              },
            ),

              const SizedBox(height: 10),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Confirm your password',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  } else if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _onSignupPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[200], // Button background color
                ),
                child: const Text('Create'),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'Already using Famie? ',
                  style: const TextStyle(fontSize: 16.0, color: Colors.black, fontFamily: 'Georgia'),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Log in',
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16.0,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Georgia'),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => const MyApp()),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();}
}