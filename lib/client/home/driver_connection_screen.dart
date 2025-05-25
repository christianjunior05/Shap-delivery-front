import 'package:flutter/material.dart';
import 'delivery_tracking_screen.dart';
import 'home_screen.dart';

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
      drawer: _buildDrawer(),
      body: SizedBox(
        width: 393,
        height: 852,
        child: Stack(
          children: [
            // Barre de statut avec l'heure
            Positioned(
              left: 41,
              top: 19,
              child: Text(
                '11:50',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),

            // // Icônes de statut (WiFi, réseau, batterie)
            // Positioned(
            //   right: 43,
            //   top: 17,
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Icon(Icons.signal_cellular_4_bar,
            //           size: 21, color: Colors.black),
            //       SizedBox(width: 21),
            //       Icon(Icons.wifi, size: 19, color: Colors.black),
            //       SizedBox(width: 19),
            //       Icon(Icons.battery_full, size: 24, color: Colors.black),
            //     ],
            //   ),
            // ),

            // Bouton retour (flèche gauche)
            Positioned(
              left: 33,
              top: 62,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..scale(-1.0, 1.0),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white.withOpacity(0.5),
                    size: 21,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),

            // Menu hamburger (3 lignes)
            Positioned(
              left: 41,
              top: 73,
              child: InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Column(
                  children: [
                    Container(
                      width: 24.85,
                      height: 4.27,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    SizedBox(height: 2.86),
                    Container(
                      width: 24.85,
                      height: 4.27,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    SizedBox(height: 2.86),
                    Container(
                      width: 24.85,
                      height: 4.27,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Flèche droite
            Positioned(
              left: 357,
              top: 62,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black.withOpacity(0.5),
                  size: 21,
                ),
                onPressed: () {
                  // Action pour la flèche droite
                },
              ),
            ),

            // Titre principal
            Positioned(
              left: (393 - 349) / 2,
              top: 112,
              child: SizedBox(
                width: 349,
                height: 37,
                child: Text(
                  'Connexion au livreur...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    height: 37 / 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Texte descriptif
            Positioned(
              left: 39,
              top: 172,
              child: SizedBox(
                width: 310,
                height: 69,
                child: Text(
                  'Votre commande a été prise en compte,\nnous vous mettons en contact\navec votre livreur...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    height: 1.5,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Zone blanche en bas
            Positioned(
              left: 0,
              top: 255,
              child: Container(
                width: 393,
                height: 597,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
            ),

            // Image du scooter
            Positioned(
              left: 58,
              top: 450,
              child: SizedBox(
                width: 272,
                height: 272,
                child: Image.asset(
                  'assets/images/scooter_commande.gif',
                  width: 272,
                  height: 272,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: const Color(0xFFFF5722),
      child: SafeArea(
        child: Column(
          children: [
            // En-tête avec profil utilisateur
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gbedolo Kan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Client (C0123)',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),

            // Menu items
            Expanded(
              child: Column(
                children: [
                  _buildMenuItem(
                    icon: Icons.person_outline,
                    title: 'Profil',
                    onTap: () {
                      Navigator.pop(context);
                      // Navigation vers profil
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.delivery_dining,
                    title: 'Commander',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.history,
                    title: 'Historiques',
                    onTap: () {
                      Navigator.pop(context);
                      // Navigation vers historiques
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.rate_review_outlined,
                    title: 'Avis et commentaires',
                    onTap: () {
                      Navigator.pop(context);
                      // Navigation vers avis
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.logout,
                    title: 'Se déconnecter',
                    onTap: () async {
                      Navigator.pop(context);
                      // Logique de déconnexion
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.support_agent,
                    title: 'Centre d\'appel',
                    onTap: () {
                      Navigator.pop(context);
                      // Afficher dialogue de contact
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.white, size: 24),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: onTap,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      ),
    );
  }
}
