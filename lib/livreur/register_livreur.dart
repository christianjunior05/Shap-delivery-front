import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'pending_screen.dart';

class RegisterLivreurPage extends StatefulWidget {
  const RegisterLivreurPage({Key? key}) : super(key: key);

  @override
  State<RegisterLivreurPage> createState() => _RegisterLivreurPageState();
}

class _RegisterLivreurPageState extends State<RegisterLivreurPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _carteIdentite;
  String? _permisConduire;
  String? _carteGrise;

  Future<void> _pickFile(Function(String) onPicked) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      onPicked(result.files.single.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCEEEA),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 32),
                  // Logo stylisé
                  const Text(
                    'Shap',
                    style: TextStyle(
                      fontFamily: 'Lobster',
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 48),
                  const Text(
                    "S'inscrire",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Champ Nom et prénom
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Nom et prenom',
                      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(color: Color(0xFFFF5A1E)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(color: Color(0xFFFF5A1E)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(color: Color(0xFFFF5A1E), width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Champ Email ou numéro de téléphone
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email ou numéro de téléphone',
                      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(color: Color(0xFFFF5A1E)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(color: Color(0xFFFF5A1E)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(color: Color(0xFFFF5A1E), width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Champ Mot de passe
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Mot de passe',
                      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(color: Color(0xFFFF5A1E)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(color: Color(0xFFFF5A1E)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(color: Color(0xFFFF5A1E), width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Champ Confirmer le Mot de passe
                  TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirmer le Mot de passe',
                      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(color: Color(0xFFFF5A1E)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(color: Color(0xFFFF5A1E)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(color: Color(0xFFFF5A1E), width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Téléversement Carte d'identité
                  _buildUploadRow(
                    context,
                    label: "Carte d'identité",
                    fileName: _carteIdentite,
                    onPressed: () => _pickFile((name) => setState(() => _carteIdentite = name)),
                  ),
                  const SizedBox(height: 16),
                  // Téléversement Permis de conduire
                  _buildUploadRow(
                    context,
                    label: 'Permis de conduire',
                    fileName: _permisConduire,
                    onPressed: () => _pickFile((name) => setState(() => _permisConduire = name)),
                  ),
                  const SizedBox(height: 16),
                  // Téléversement Carte grise
                  _buildUploadRow(
                    context,
                    label: 'Carte grise',
                    fileName: _carteGrise,
                    onPressed: () => _pickFile((name) => setState(() => _carteGrise = name)),
                  ),
                  const SizedBox(height: 32),
                  // Bouton S'inscrire
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const PendingScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF5A1E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                    ),
                    child: const Text(
                      "S'inscrire",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUploadRow(BuildContext context, {required String label, String? fileName, required VoidCallback onPressed}) {
    // Détermine le chemin de l'image à afficher selon le label
    String? imageAsset;
    if (label.toLowerCase().contains('identité')) {
      imageAsset = 'assets/images/carte_identite.png';
    } else if (label.toLowerCase().contains('permis')) {
      imageAsset = 'assets/images/permis_conduire.png';
    } else if (label.toLowerCase().contains('grise')) {
      imageAsset = 'assets/images/carte_grise.png';
    }

    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFFF5A1E)),
              borderRadius: BorderRadius.circular(28),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              children: [
                const Text('Téléverser', style: TextStyle(color: Colors.black54)),
                const Spacer(),
                GestureDetector(
                  onTap: onPressed,
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.upload, size: 20),
          onPressed: () {
            if (imageAsset != null) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Image.asset(imageAsset!, height: 180),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Fermer'),
                    ),
                  ],
                ),
              );
            }
            onPressed();
          },
        ),
      ],
    );
  }
} 