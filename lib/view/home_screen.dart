import 'package:flutter/material.dart';
import 'credential_details_screen.dart';
import 'password_generator_screen.dart';
import 'user_profile_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PasswordEntry> entries = [
      const PasswordEntry(title: 'Hack the box - Build and sustain hig...', url: 'https://www.hackthebox.com/'),
      const PasswordEntry(title: 'Shodan Search Engine - The entire...', url: 'https://account.shodan.io/'),
      const PasswordEntry(title: 'TryHackMe - The Hacking platform...', url: 'https://www.tryhackme.com'),
      const PasswordEntry(title: 'Facebook - Your favorite social med...', url: 'https://www.facebook.com/'),
      const PasswordEntry(title: 'Instagram - Simille more for a bett...', url: 'https://www.instagram.com/'),
      const PasswordEntry(title: 'PalmeirasPay - O banco da familli...', url: 'https://www.palmeiraspay.com/'),
      const PasswordEntry(title: 'SPFC - O mais querido', url: 'https://www.saopaulofc.net/'),
      const PasswordEntry(title: 'Sympla - O evento próximo de você', url: 'https://www.sympla.com.br'),
      const PasswordEntry(title: 'Amazon - Tudo em um só lugar', url: 'https://www.amazon.com'),
      const PasswordEntry(title: 'Santos Futebol Clube - O Maior Bras...', url: 'https://www.santosfc.com'),
    ];

    const Color primaryTextColor = Color(0xFFF5B984);

    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primaryTextColor),
        title: const Text(
          'Todas as entradas',

          style: TextStyle(
            color: primaryTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFFFFDAB9),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFFFFDAB9),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Fecha o drawer
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const UserProfileScreen()));
                    },
                    child: Image.asset(
                      'assets/images/icon-without-name.png',
                      height: 80,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.vpn_key_outlined, color: Color(0xFF212121)),
              title: const Text('Todas as entradas', style: TextStyle(color: Color(0xFF212121), fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.password_rounded, color: Color(0xFF212121)),
              title: const Text('Gerador de senhas', style: TextStyle(color: Color(0xFF212121), fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context); // Fecha o drawer
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const PasswordGeneratorScreen()));
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          final entry = entries[index];
          final subtitleText = entry.url.replaceAll('https://', '').replaceAll('www.', '');

          return ListTile(
            leading: const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
            title: Text(entry.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            subtitle: Text(subtitleText, style: const TextStyle(color: Colors.white70, fontSize: 12)),
            onTap: () {
              // CORRIGIDO: Navegação para a tela correta (Detalhes da Credencial)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CredentialDetailsScreen(entry: entry),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PasswordEntry {
  final String title;
  final String url;

  const PasswordEntry({
    required this.title,
    required this.url,
  });
}

