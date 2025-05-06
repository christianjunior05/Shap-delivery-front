import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class PendingScreen extends StatefulWidget {
  const PendingScreen({Key? key}) : super(key: key);

  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 15), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCEEEA),
      body: Column(
        children: [
          // Header orange arrondi
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            child: Container(
              color: const Color(0xFFFF5A1E),
              width: double.infinity,
              padding: const EdgeInsets.only(top: 40, bottom: 32),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.menu, color: Colors.white),
                        SizedBox(width: 12),
                        Icon(Icons.arrow_back_ios, color: Colors.white),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'En attente...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'Nous avons pris en compte votre demande,\nelle est en cours de traitement, nous vous prions de patienter...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          // GIF animé centré sur fond blanc arrondi
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 24, bottom: 24),
                  child: Image.asset(
                    'assets/images/waiting_delivery.gif',
                    height: 200,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 