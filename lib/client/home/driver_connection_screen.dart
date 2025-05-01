import 'package:flutter/material.dart';
import 'delivery_tracking_screen.dart';

class DriverConnectionScreen extends StatefulWidget {
  const DriverConnectionScreen({super.key});

  @override
  State<DriverConnectionScreen> createState() => _DriverConnectionScreenState();
}

class _DriverConnectionScreenState extends State<DriverConnectionScreen> {
  @override
  void initState() {
    super.initState();
    // Simuler un délai de connexion puis naviguer vers l'écran de suivi
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DeliveryTrackingScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF5722),
      body: SafeArea(
        child: Column(
          children: [
            // Barre de navigation
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white, size: 30),
                    onPressed: () {
                      // Ouvrir le menu
                    },
                  ),
                ],
              ),
            ),
            // Contenu principal
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Connexion au livreur...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Votre commande a été prise en compte,\nnous vous mettons en contact\navec votre livreur...',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 50),
                    // Image du scooter
                    Image.asset(
                      'assets/images/scooter_11933522.png',
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 50),
                    // Indicateur de chargement
                    const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
