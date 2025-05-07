import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'confirmation_dialog.dart';
import 'commandes_screen.dart';

enum LivraisonEtat {
  attenteExpediteur,
  livraisonEnCours,
  attenteDestinataire,
}

class LivraisonStateScreen extends StatelessWidget {
  final LivraisonEtat etat;
  final VoidCallback? onSuivre;
  final VoidCallback? onConfirmer;
  final String? timer;

  const LivraisonStateScreen({
    Key? key,
    required this.etat,
    this.onSuivre,
    this.onConfirmer,
    this.timer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Définir les textes et widgets selon l'état
    String titre = '';
    String? sousTitre;
    String? timerAffiche = timer;
    Widget? boutonPrincipal;
    Widget? infosPersonnes;
    Widget? prixWidget;
    Color boutonColor = const Color(0xFFFF5A1E);
    String boutonText = 'Suivre';
    bool showAnnuler = true;

    switch (etat) {
      case LivraisonEtat.attenteExpediteur:
        titre = "Arriver\nEn attente de l'expéditeur...";
        sousTitre =
            "Vous êtes arrivé au lieu de prise en charge du colis. Vous pouvez contacter l'expéditeur📞...";
        boutonText = 'Suivre';
        boutonPrincipal =
            _buildButton(boutonText, onSuivre, color: boutonColor);
        infosPersonnes = _buildExpediteur(context);
        break;
      case LivraisonEtat.livraisonEnCours:
        titre = "Colis pris en charge\nLivraison en cours...";
        sousTitre =
            "Vous avez récupéré le colis.\nVous pouvez trouver ci-dessous le contact du destinataire...";
        boutonText = 'Suivre';
        boutonPrincipal =
            _buildButton(boutonText, onSuivre, color: boutonColor);
        infosPersonnes = Column(
          children: [
            _buildExpediteur(context),
            const SizedBox(height: 16),
            _buildDestinataire(context),
          ],
        );
        break;
      case LivraisonEtat.attenteDestinataire:
        titre = "Arriver\nEn attente du destinataire...";
        sousTitre =
            "Vous êtes arrivé à destination. Vous pouvez contacter le destinataire📞...";
        boutonText = 'Confirmer';
        boutonColor = const Color(0xFFFF5A1E);
        boutonPrincipal =
            _buildButton(boutonText, onConfirmer, color: boutonColor);
        prixWidget = _buildPrix();
        infosPersonnes = Column(
          children: [
            _buildExpediteur(context),
            const SizedBox(height: 16),
            _buildDestinataire(context),
          ],
        );
        break;
    }

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
              padding: const EdgeInsets.only(top: 40, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.arrow_back_ios, color: Colors.black),
                        SizedBox(width: 12),
                        Icon(Icons.menu, color: Colors.white),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    titre,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (timerAffiche != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      timerAffiche,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      sousTitre,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Carte Google Maps
          SizedBox(
            height: 220,
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(5.348, -4.027),
                zoom: 13,
              ),
              markers: {
                const Marker(
                  markerId: MarkerId('depart'),
                  position: LatLng(5.348, -4.027),
                  infoWindow: InfoWindow(title: 'Départ'),
                ),
                const Marker(
                  markerId: MarkerId('arrivee'),
                  position: LatLng(5.400, -3.990),
                  infoWindow: InfoWindow(title: 'Destination'),
                ),
              },
              polylines: {
                Polyline(
                  polylineId: const PolylineId('itineraire'),
                  color: Colors.deepOrange,
                  width: 5,
                  points: const [
                    LatLng(5.348, -4.027),
                    LatLng(5.360, -4.010),
                    LatLng(5.380, -4.000),
                    LatLng(5.400, -3.990),
                  ],
                ),
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
            ),
          ),
          // Suivi livraison et infos
          Expanded(
            child: Container(
              color: const Color(0xFFFCEEEA),
              width: double.infinity,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Suivi de la livraison',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: const [
                            Icon(Icons.timer, color: Color(0xFFFF5A1E)),
                            SizedBox(width: 8),
                            Text('Durée de la livraison : ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('A 5 mins'),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: const [
                            Icon(Icons.location_on, color: Color(0xFFFF5A1E)),
                            SizedBox(width: 8),
                            Text('Adresse de départ : ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Expanded(child: Text('Cocody Riv Palmeraie')),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: const [
                            Icon(Icons.location_on, color: Color(0xFFFF5A1E)),
                            SizedBox(width: 8),
                            Text('Adresse de destination : ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Expanded(child: Text('Abobo Gare Bingerville')),
                          ],
                        ),
                        if (prixWidget != null) ...[
                          const SizedBox(height: 12),
                          prixWidget,
                        ],
                        const SizedBox(height: 20),
                        const Divider(),
                        infosPersonnes,
                        const SizedBox(height: 20),
                        boutonPrincipal,
                        if (showAnnuler)
                          Center(
                            child: TextButton(
                              onPressed: () async {
                                final result =
                                    await showConfirmationDialog(context);
                                if (result == true) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CommandesScreen()),
                                    (route) => false,
                                  );
                                }
                              },
                              child: const Text('Annuler',
                                  style: TextStyle(color: Colors.black45)),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback? onPressed,
      {Color color = const Color(0xFFFF5A1E)}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildExpediteur(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/profile.png'),
          radius: 22,
        ),
        const SizedBox(width: 10),
        const Text('Expéditeur',
            style: TextStyle(
                color: Color(0xFFFF5A1E), fontWeight: FontWeight.bold)),
        const SizedBox(width: 10),
        const Text('Commande n° 0123',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.phone, color: Color(0xFFFF5A1E)),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.message, color: Color(0xFFFF5A1E)),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildDestinataire(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/profile2.png'),
          radius: 22,
        ),
        const SizedBox(width: 10),
        const Text('Destinataire',
            style: TextStyle(
                color: Color(0xFFFF5A1E), fontWeight: FontWeight.bold)),
        const SizedBox(width: 10),
        const Text('Commande n° 0123',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.phone, color: Color(0xFFFF5A1E)),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.message, color: Color(0xFFFF5A1E)),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildPrix() {
    return Row(
      children: const [
        Icon(Icons.attach_money, color: Color(0xFFFF5A1E)),
        SizedBox(width: 8),
        Text('Prix : ', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('2 500 fr CFA'),
      ],
    );
  }
}
