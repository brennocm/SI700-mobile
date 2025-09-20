import 'package:flutter/material.dart';
import 'home_screen.dart';

class MasterKeyScreen extends StatefulWidget {
  const MasterKeyScreen({super.key});

  @override
  State<MasterKeyScreen> createState() => _MasterKeyScreenState();
}

class _MasterKeyScreenState extends State<MasterKeyScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFDAB9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF212121)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/icon-without-name.png',
                height: 80,
                color: const Color(0xFF212121),
              ),
              const SizedBox(height: 24),
              const Text(
                'Chave-Mestre',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212121),
                ),
              ),
              const SizedBox(height: 48),
              const Text(
                'Digite sua chave-mestre',
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: const Color(0xFF212121),
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Trata-se da chave para descriptografar todas as suas senhas.',
                style: TextStyle(
                  color: Color(0xFF5a5a5a),
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF212121),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Próximo',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

