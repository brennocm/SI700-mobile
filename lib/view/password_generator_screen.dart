import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class PasswordGeneratorScreen extends StatefulWidget {
  const PasswordGeneratorScreen({super.key});

  @override
  State<PasswordGeneratorScreen> createState() =>
      _PasswordGeneratorScreenState();
}

class _PasswordGeneratorScreenState extends State<PasswordGeneratorScreen> {

  double _passwordLength = 16;
  bool _includeUppercase = true;
  bool _includeLowercase = true;
  bool _includeNumbers = true;
  bool _includeSpecial = true;
  String _generatedPassword = '';
  bool _showCopiedMessage = false;

  final String _uppercaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final String _lowercaseChars = 'abcdefghijklmnopqrstuvwxyz';
  final String _numberChars = '0123456789';
  final String _specialChars = '~!@#\$%^&*()-_=+[]{}|;:,.<>?';

  @override
  void initState() {
    super.initState();
    _generatePassword(); 
  }


  void _generatePassword() {
    if (!_includeUppercase &&
        !_includeLowercase &&
        !_includeNumbers &&
        !_includeSpecial) {
      setState(() {
        _generatedPassword = 'Selecione uma opção';
      });
      return;
    }

    String chars = '';
    if (_includeUppercase) chars += _uppercaseChars;
    if (_includeLowercase) chars += _lowercaseChars;
    if (_includeNumbers) chars += _numberChars;
    if (_includeSpecial) chars += _specialChars;

    Random random = Random();
    String password = String.fromCharCodes(
      Iterable.generate(
        _passwordLength.toInt(),
        (_) => chars.codeUnitAt(random.nextInt(chars.length)),
      ),
    );

    setState(() {
      _generatedPassword = password;
    });
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _generatedPassword));
    setState(() => _showCopiedMessage = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _showCopiedMessage = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      appBar: AppBar(
        title: const Text(
          'Gerador de senhas',
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
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPasswordDisplay(),
                const SizedBox(height: 40),
                _buildLengthControl(),
                const SizedBox(height: 20),
                _buildCheckboxOption(
                  title: 'Letras maiúsculas (A-Z)',
                  value: _includeUppercase,
                  onChanged: (val) => setState(() {
                    _includeUppercase = val!;
                    _generatePassword();
                  }),
                ),
                _buildCheckboxOption(
                  title: 'Letras minúsculas (a-z)',
                  value: _includeLowercase,
                  onChanged: (val) => setState(() {
                    _includeLowercase = val!;
                    _generatePassword();
                  }),
                ),
                _buildCheckboxOption(
                  title: 'Dígitos numéricos (0-9)',
                  value: _includeNumbers,
                  onChanged: (val) => setState(() {
                    _includeNumbers = val!;
                    _generatePassword();
                  }),
                ),
                _buildCheckboxOption(
                  title: 'Caracteres especiais',
                  subtitle: _specialChars,
                  value: _includeSpecial,
                  onChanged: (val) => setState(() {
                    _includeSpecial = val!;
                    _generatePassword();
                  }),
                ),
              ],
            ),
          ),
          if (_showCopiedMessage)
            Container(
              color: Colors.black54,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 25,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'SENHA COPIADA',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
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

  Widget _buildPasswordDisplay() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                _generatedPassword,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.copy_outlined, color: Colors.grey),
              onPressed: _copyToClipboard,
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'SENHA FORTE',
          style: TextStyle(
            color: Colors.greenAccent,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildLengthControl() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Comprimento da senha: ${_passwordLength.toInt()}',
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        Slider(
          value: _passwordLength,
          min: 8,
          max: 32,
          divisions: 24,
          label: _passwordLength.toInt().toString(),
          activeColor: const Color(0xFFFFDAB9),
          inactiveColor: Colors.grey.shade700,
          onChanged: (value) {
            setState(() {
              _passwordLength = value;
            });
          },
          onChangeEnd: (value) {
            _generatePassword();
          },
        ),
      ],
    );
  }

  Widget _buildCheckboxOption({
    required String title,
    String? subtitle,
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: Colors.grey,
      ),
      child: CheckboxListTile(
        title: Text(title, style: const TextStyle(color: Colors.white)),
        subtitle: subtitle != null
            ? Text(subtitle, style: const TextStyle(color: Colors.grey))
            : null,
        value: value,
        onChanged: onChanged,
        activeColor: const Color(0xFFFFDAB9),
        checkColor: const Color(0xFF212121),
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
