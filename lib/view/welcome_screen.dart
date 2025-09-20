import 'package:flutter/material.dart';
import 'create_account_screen.dart';
import 'login_screen.dart';
import 'forgot_password_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFDAB9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                'assets/images/icon-with-name.png',
                height: 150,
              ),
              const SizedBox(height: 16),
              const Text(
                'O cofre digital para suas senhas',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 70),
              ElevatedButton(
                onPressed: () {
                  print('Botão "Criar uma conta" pressionado');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateAccountScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF212121),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text(
                  'Criar uma conta',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  print('Botão "Iniciar sessão" pressionado');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: const Text(
                  'Iniciar sessão',
                  style: TextStyle(
                    color: Color(0xFF212121),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  print('Botão "Esqueci minha senha" pressionado');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen()),
                  );
                },
                child: const Text(
                  'Esqueci minha senha',
                  style: TextStyle(
                    color: Color(0xFF212121),
                    fontSize: 14,
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

