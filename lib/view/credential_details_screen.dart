import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart'; 

class CredentialDetailsScreen extends StatefulWidget {
  final PasswordEntry entry;

  const CredentialDetailsScreen({super.key, required this.entry});

  @override
  State<CredentialDetailsScreen> createState() =>
      _CredentialDetailsScreenState();
}

class _CredentialDetailsScreenState extends State<CredentialDetailsScreen> {
  bool _isPasswordVisible = false;
  bool _isOldPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _showSuccessMessage = false;

  void _showSuccess() {
    setState(() {
      _showSuccessMessage = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _showSuccessMessage = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryTextColor = Color(0xFFF5B984);

    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primaryTextColor),
        title: const Text(
          'Perfil de credencial',
          style: TextStyle(
            color: primaryTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                // Seção de Login
                _buildInfoSection(),
                const Divider(color: Colors.white24, height: 40),
                // Seção de Edição
                _buildEditSection(),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _showSuccess,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFDAB9),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Confirmar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF212121),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_showSuccessMessage)
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'AÇÃO CONCLUÍDA COM SUCESSO!',
                      style: TextStyle(
                        color: Color(0xFF212121),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 24),
                    Icon(
                      Icons.lock_outline,
                      color: Color(0xFF212121),
                      size: 48,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Login',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          widget.entry.title,
          style: const TextStyle(color: Colors.white70, fontSize: 16),
        ),
        const SizedBox(height: 24),
        _buildCopyableField(
          label: 'kevin_mitnik@sec.consulting',
          isPassword: true,
          isVisible: _isPasswordVisible,
          onVisibilityChanged: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ],
    );
  }

  Widget _buildEditSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Editar',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildEditableField(
          label: 'Senha antiga:',
          isVisible: _isOldPasswordVisible,
          onVisibilityChanged: () {
            setState(() {
              _isOldPasswordVisible = !_isOldPasswordVisible;
            });
          },
        ),
        const SizedBox(height: 16),
        _buildEditableField(
          label: 'Senha nova:',
          isVisible: _isNewPasswordVisible,
          onVisibilityChanged: () {
            setState(() {
              _isNewPasswordVisible = !_isNewPasswordVisible;
            });
          },
        ),
        const SizedBox(height: 16),
        _buildEditableField(
          label: 'Confirmar senha nova:',
          isVisible: _isConfirmPasswordVisible,
          onVisibilityChanged: () {
            setState(() {
              _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
            });
          },
        ),
      ],
    );
  }

  Widget _buildCopyableField({
    required String label,
    required bool isPassword,
    required bool isVisible,
    required VoidCallback onVisibilityChanged,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            isVisible ? label : '●' * label.length,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        if (isPassword)
          IconButton(
            icon: Icon(isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                color: Colors.white70),
            onPressed: onVisibilityChanged,
          ),
        IconButton(
          icon: const Icon(Icons.copy_outlined, color: Colors.white70),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: label));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Copiado para a área de transferência!')),
            );
          },
        ),
      ],
    );
  }

  Widget _buildEditableField({
    required String label,
    required bool isVisible,
    required VoidCallback onVisibilityChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70)),
        TextField(
          obscureText: !isVisible,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: '●●●●●●●●●●●●',
            hintStyle: TextStyle(color: Colors.grey[700]),
            suffixIcon: IconButton(
              icon: Icon(isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: Colors.white70),
              onPressed: onVisibilityChanged,
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white24),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

