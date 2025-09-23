import 'package:flutter/material.dart';
import 'view/welcome_screen.dart';

void main() {
  runApp(const KeyGuardianApp());
}

class KeyGuardianApp extends StatelessWidget {
  const KeyGuardianApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KeyGuardian',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Sans-serif',
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF333333), 
          ),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

