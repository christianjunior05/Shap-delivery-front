import 'package:flutter/material.dart';
import 'livraison_state_screen.dart';
import 'commandes_screen.dart';

class SuiviLivraisonScreen extends StatefulWidget {
  const SuiviLivraisonScreen({Key? key}) : super(key: key);

  @override
  State<SuiviLivraisonScreen> createState() => _SuiviLivraisonScreenState();
}

class _SuiviLivraisonScreenState extends State<SuiviLivraisonScreen> {
  LivraisonEtat _etat = LivraisonEtat.attenteExpediteur;
  String? _timer = "01:05";

  void _nextState() {
    setState(() {
      if (_etat == LivraisonEtat.attenteExpediteur) {
        _etat = LivraisonEtat.livraisonEnCours;
        _timer = null;
      } else if (_etat == LivraisonEtat.livraisonEnCours) {
        _etat = LivraisonEtat.attenteDestinataire;
        _timer = "02:10";
      }
    });
  }

  void _showSuccessScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const SuccessLivraisonScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LivraisonStateScreen(
      etat: _etat,
      timer: _timer,
      onSuivre: _nextState,
      onConfirmer: () {
        _showSuccessScreen();
      },
    );
  }
}

// Nouvelle page de succès
class SuccessLivraisonScreen extends StatelessWidget {
  const SuccessLivraisonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCEEEA),
      body: SafeArea(
        child: Column(
          children: [
            // Header avec carte arrondi
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
              child: SizedBox(
                height: 320,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/delivery-service-scooter-3d-illustration.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    const Text(
                      'Course terminée',
                      style: TextStyle(
                        color: Color(0xFFFF5A1E),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Vous êtes arrivé à destination 🥳🎉',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/profile2.png'),
                            radius: 28,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Gbedolo KAN',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text('Commande n° 0123'),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.phone,
                                color: Color(0xFFFF5A1E)),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.message,
                                color: Color(0xFFFF5A1E)),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.money, color: Color(0xFFFF5A1E)),
                          SizedBox(width: 8),
                          Text('Prix : ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('2 500 fr CFA'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const CommandesScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF5A1E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Voir les commandes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
