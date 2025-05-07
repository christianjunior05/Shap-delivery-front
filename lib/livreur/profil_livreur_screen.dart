import 'package:flutter/material.dart';

class ProfilLivreurScreen extends StatelessWidget {
  const ProfilLivreurScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCEEEA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Profil',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 8),
              const CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage('assets/images/livreur_avatar.png'),
              ),
              const SizedBox(height: 12),
              const Text(
                'Kome Bakary',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const Text(
                'Livreur 0001',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 18),
              _buildEditableField('Tel:', '+225 05 05 00 00 00'),
              _buildEditableField('Email:', 'komebakary@gmail.com'),
              _buildEditableField('Nom et prénom:', 'KOME Bakary'),
              _buildEditableField('Mot de passe:', 'KomeACD', isPassword: true),
              _buildPieceJointe('Carte d\'identité'),
              _buildPieceJointe('Permis de conduire'),
              _buildPieceJointe('Carte grise'),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF5A1E),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'Enregistrer',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField(String label, String value,
      {bool isPassword = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFFF5A1E), width: 1),
        borderRadius: BorderRadius.circular(28),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                obscureText: isPassword,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: label,
                  labelStyle: const TextStyle(color: Colors.black54),
                ),
                controller: TextEditingController(text: value),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Color(0xFFFF5A1E)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildPieceJointe(String label) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFFF5A1E), width: 1),
        borderRadius: BorderRadius.circular(28),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          const Text('Pièce jointe', style: TextStyle(color: Colors.black54)),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFFFF5A1E),
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.upload, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
