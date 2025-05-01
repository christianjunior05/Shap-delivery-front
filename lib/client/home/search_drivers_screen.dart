import 'package:flutter/material.dart';
import 'driver_connection_screen.dart';

class SearchDriversScreen extends StatelessWidget {
  const SearchDriversScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF5722), // Orange vif
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Recherche en cours...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Veuillez patienter le temps que nous vous présentons les livreurs disponibles à proximité de chez vous...',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 30),
                      // Grille des livreurs
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.8,
                        children: [
                          _buildDriverCard(
                            context: context,
                            price: '2.500',
                            time: '5 minutes',
                            subtitle: 'Livraison Express',
                          ),
                          _buildDriverCard(
                            context: context,
                            price: '2.000',
                            time: '15 minutes',
                            subtitle: '1 livraison à terminer',
                          ),
                          _buildDriverCard(
                            context: context,
                            price: '1.500',
                            time: '30 minutes',
                            subtitle: '2 livraisons à terminer',
                          ),
                          _buildDriverCard(
                            context: context,
                            price: '1.000',
                            time: '1 heure',
                            subtitle: '3 livraisons à terminer',
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDriverCard({
    required BuildContext context,
    required String price,
    required String time,
    required String subtitle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Prix
          Text(
            '$price\nFr CFA',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFFF5722),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          // Illustration
          Image.asset(
            'assets/images/3699591 1.png',
            height: 80,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 10),
          // Temps et sous-titre
          Text(
            'À $time',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 10),
          // Bouton Commander
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DriverConnectionScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF5722),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              minimumSize: const Size(120, 35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Commander',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
