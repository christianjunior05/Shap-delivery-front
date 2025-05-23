import 'package:flutter/material.dart';
import 'driver_connection_screen.dart';

class SearchDriversScreen extends StatelessWidget {
  const SearchDriversScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF5722),
      body: SafeArea(
        child: Stack(
          children: [
            // Bouton retour
            Positioned(
              top: 20,
              left: 10,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            // Titre et sous-titre
            Positioned(
              top: 80,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  const Text(
                    'Recherche en cours...',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Veuillez patienter le temps que nous vous présentons les livreurs disponibles à proximité de chez vous...',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Conteneur blanc arrondi
            Positioned(
              left: 0,
              right: 0,
              top: 200,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF3F0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    children: [
                      _buildDriverCard(
                        context: context,
                        price: '2 500',
                        time: 'A 5 minutes',
                        subtitle: 'Prêt pour une\nLivraison Express',
                      ),
                      _buildDriverCard(
                        context: context,
                        price: '2 000',
                        time: 'A 15 minutes',
                        subtitle: '1 livraison a terminé',
                      ),
                      _buildDriverCard(
                        context: context,
                        price: '1 500',
                        time: 'A 30 minutes',
                        subtitle: '2 livraisons a terminé',
                      ),
                      _buildDriverCard(
                        context: context,
                        price: '1 000',
                        time: 'A 1 heure de temps',
                        subtitle: '5 livraisons a terminé',
                      ),
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
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Contenu principal
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 25),
              // Image
              Image.asset(
                'assets/images/3699591 1.png',
                height: 80,
                width: 80,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 15),
              // Texte
              Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 15),
              // Bouton Commander
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const DriverConnectionScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF5722),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text(
                        'Commander',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Badge prix
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                color: Color(0xFFFF5722),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '$price\nFr Cfa',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
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
