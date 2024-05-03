import 'package:flutter/material.dart';
import 'signup_screen.dart'; // Import your SignupScreen widget

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1A5E),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Quizard',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 64,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w900,
                  height: 1.37, // Adjusted from 88 to be relative
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '1,000+ quizzes to challenge you and\nyour friends on all topics!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Nunito',
                  height: 1.375, // Adjusted from 22 to be relative
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupScreen()),
                  );
                },
                color: const Color(0xFF41E5ED),
                height: 46,
                minWidth: 215,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'Start playing',
                  style: TextStyle(
                    color: Color(0xFF1C1A5E),
                    fontSize: 16,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                    height: 1.375,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
