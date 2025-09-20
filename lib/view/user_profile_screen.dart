import 'package:flutter/material.dart';
import 'master_key_confirmation_screen.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool _isUserPasswordVisible = false;
  bool _isMasterKeyVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      appBar: AppBar(
        title: const Text(
          'Perfil de usuário',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserInfoSection(),
            const SizedBox(height: 24),
            const Divider(color: Colors.grey),
            const SizedBox(height: 24),
            _buildEditSection(),
            const SizedBox(height: 32),
            _buildConfirmButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoField(
            label: 'E-mail de usuário', value: 'kevin_mitnik@sec.consulting'),
        const SizedBox(height: 24),
        _buildInfoField(
          label: 'Senha de usuário',
          value: '●●●●●●●●●●●●',
          isObscured: true,
          isVisible: _isUserPasswordVisible,
          onToggleVisibility: () =>
              setState(() => _isUserPasswordVisible = !_isUserPasswordVisible),
        ),
        const SizedBox(height: 24),
        _buildInfoField(
          label: 'Chave-mestra de usuário',
          value: '●●●●●●●●●●●●●●●●●●',
          isObscured: true,
          isVisible: _isMasterKeyVisible,
          onToggleVisibility: () =>
              setState(() => _isMasterKeyVisible = !_isMasterKeyVisible),
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
        const SizedBox(height: 24),
        _buildEditableField(label: 'Senha antiga:'),
        const SizedBox(height: 16),
        _buildEditableField(label: 'Senha nova:'),
        const SizedBox(height: 16),
        _buildEditableField(label: 'Confirmar senha nova:'),
      ],
    );
  }
  Widget _buildConfirmButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const MasterKeyConfirmationScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFDAB9),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: const Text(
          'Confirmar',
          style: TextStyle(
              color: Color(0xFF212121),
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildInfoField({
    required String label,
    required String value,
    bool isObscured = false,
    bool isVisible = false,
    VoidCallback? onToggleVisibility,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Text(
                isObscured && !isVisible ? '●' * value.length : value,
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            if (isObscured)
              IconButton(
                icon: Icon(
                  isVisible
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.grey,
                ),
                onPressed: onToggleVisibility,
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildEditableField({required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 8),
        const TextField(
          obscureText: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: '●●●●●●●●●●●●',
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

