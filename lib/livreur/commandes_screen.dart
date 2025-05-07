import 'package:flutter/material.dart';
import 'connexion_commande_screen.dart';

class CommandesScreen extends StatelessWidget {
  const CommandesScreen({Key? key}) : super(key: key);

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
              padding: const EdgeInsets.only(top: 40, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.arrow_back_ios, color: Colors.black),
                        SizedBox(width: 12),
                        Icon(Icons.menu, color: Colors.white),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'Demandes de livraison...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'Veuillez patienter le temps que nous vous présentons les commandes disponibles à proximité...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          // Liste des commandes sur fond clair arrondi
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 32,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8,
                children: List.generate(4, (index) {
                  final num = 123 + index;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/livraison_card.png',
                          height: 80,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Commande : n°0$num',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Statut : En attente',
                          style: TextStyle(fontSize: 13),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ConnexionCommandeScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF5A1E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                            ),
                            child: const Text('Accepter'),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
