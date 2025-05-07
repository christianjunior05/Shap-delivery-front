import 'package:flutter/material.dart';
import 'suivi_livraison_screen.dart';

class ConnexionCommandeScreen extends StatelessWidget {
  const ConnexionCommandeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF5A1E),
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.arrow_back_ios, color: Colors.black),
                        SizedBox(width: 12),
                        Icon(Icons.menu, color: Colors.white),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SuiviLivraisonScreen(),
                              ),
                            );
                          },
                          child: Icon(Icons.arrow_forward_ios,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      'Connexion à la commande...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        'Votre requête a été prise en compte,\nnous vous mettons en contact avec le client...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
          // Illustration scooter sur fond clair arrondi
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              child: Container(
                color: Colors.white,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 40),
                child: Image.asset(
                  'assets/images/scooter_commande.gif',
                  height: 180,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
