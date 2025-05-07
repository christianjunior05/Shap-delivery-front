import 'package:flutter/material.dart';
import 'drawer/livreur_drawer.dart';

class CommentairesLivreurScreen extends StatefulWidget {
  const CommentairesLivreurScreen({Key? key}) : super(key: key);

  @override
  State<CommentairesLivreurScreen> createState() =>
      _CommentairesLivreurScreenState();
}

class _CommentairesLivreurScreenState extends State<CommentairesLivreurScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFFCEEEA),
      drawer: const LivreurDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        centerTitle: true,
        title: const Text(
          'Commentaires',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              children: [
                _buildCommentaire(
                  nom: 'Kome Bakary/Livreur L0001',
                  commande: '0012',
                  date: '26/02/2025',
                  motif:
                      "J'ai annulé la commande car le client ne répondait plus au téléphone.",
                ),
                _buildCommentaire(
                  nom: 'Kome Bakary/Livreur L0001',
                  commande: '0212',
                  date: '20/02/2025',
                  motif: "Commande annulée car long temps d'attente",
                ),
                _buildCommentaire(
                  nom: 'Kome Bakary/Livreur L0001',
                  commande: '1025',
                  date: '01/02/2025',
                  motif:
                      "J'ai été obligé d'annuler car ma moto est tombée en panne.",
                ),
                _buildCommentaire(
                  nom: 'Kome Bakary/Livreur L0001',
                  commande: '2135',
                  date: '30/01/2025',
                  motif: "Commande annulée car j'ai changé d'avis.",
                ),
                _buildCommentaire(
                  nom: 'Kome Bakary/Livreur L0001',
                  commande: '2140',
                  date: '25/01/2025',
                  motif:
                      "Commande annulée car client désagréable et irrespectueux au téléphone",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5A1E),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: const Text(
                  'Terminé',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentaire({
    required String nom,
    required String commande,
    required String date,
    required String motif,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: nom,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: '  ',
                      style: const TextStyle(fontSize: 16),
                    ),
                    TextSpan(
                      text: 'Commande n°$commande',
                      style: const TextStyle(
                        color: Color(0xFFFF5A1E),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                date,
                style: const TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'Commentaire',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Text(
            motif,
            style: const TextStyle(fontSize: 14),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
