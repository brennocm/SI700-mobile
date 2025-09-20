import 'package:flutter/material.dart';

class MasterKeyConfirmationScreen extends StatefulWidget {
  const MasterKeyConfirmationScreen({super.key});

  @override
  State<MasterKeyConfirmationScreen> createState() =>
      _MasterKeyConfirmationScreenState();
}

class _MasterKeyConfirmationScreenState
    extends State<MasterKeyConfirmationScreen> {
  bool _isMasterKeyVisible = false;
  bool _showSuccessMessage = false;

  void _triggerSuccessMessage() {
    setState(() => _showSuccessMessage = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      appBar: AppBar(
        title: const Text(
          'Digite sua chave-mestra',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const Text(
                  'Chave-mestra de usuário',
                  style: TextStyle(
                      color: Color(0xFFFFDAB9),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  obscureText: !_isMasterKeyVisible,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                    hintText: '●●●●●●●●●●●●●●●●●●',
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isMasterKeyVisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isMasterKeyVisible = !_isMasterKeyVisible;
                        });
                      },
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _triggerSuccessMessage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFDAB9),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: const Text(
                      'Confirmar',
                      style: TextStyle(
                          color: Color(0xFF212121),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_showSuccessMessage)
            Container(
              color: Colors.black54,
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'AUTENTICAÇÃO CONCLUÍDA',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 15),
                      Icon(Icons.lock_outline, size: 40, color: Colors.black),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
