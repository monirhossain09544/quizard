// main.dart

import 'package:flutter/material.dart';
import 'welcome_screen.dart'; // Make sure this path is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizard',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const WelcomeScreen(), // This is your custom WelcomeScreen from another file
    );
  }
}
