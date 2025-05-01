import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  Widget _buildReviewItem({
    required String clientName,
    required String clientId,
    required String date,
    required String commandNumber,
    required int rating,
    required String comment,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$clientName/Client $clientId',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(date),
            ],
          ),
          Text(
            'Commande n°$commandNumber',
            style: const TextStyle(
              color: Color(0xFFFF5722),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text('Avis'),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: const Color(0xFFFF5722),
                size: 20,
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text('Commentaire'),
          Text(
            comment,
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
          const Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Avis et commentaires',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildReviewItem(
              clientName: 'Gbedolo KAN',
              clientId: 'C0123',
              date: '26/02/2025',
              commandNumber: '0012/L0001',
              rating: 5,
              comment:
                  "J'ai été plus que jamais satisfait de ce service, le livreur était très professionnel et respectueux.",
            ),
            _buildReviewItem(
              clientName: 'Gbedolo KAN',
              clientId: 'C0123',
              date: '20/02/2025',
              commandNumber: '1025/L0002',
              rating: 4,
              comment:
                  "J'ai été obligé d'annuler la commande car le temps d'attente était trop long.",
            ),
            _buildReviewItem(
              clientName: 'Gbedolo KAN',
              clientId: 'C0123',
              date: '01/02/2025',
              commandNumber: '1025/L0003',
              rating: 5,
              comment:
                  "J'ai reçu mon colis mais avec un peu bout abimé, j'ai quand même apprécié la rapidité du service.",
            ),
            _buildReviewItem(
              clientName: 'Gbedolo KAN',
              clientId: 'C0123',
              date: '30/01/2025',
              commandNumber: '1024/L0004',
              rating: 5,
              comment:
                  "J'ai été agréablement surpris de la qualité et le professionnalisme de vos services mais j'ai dû attendre ma course malgré que le livreur était arrivé à destination car le destinataire ne répondait pas.",
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5722),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Terminé',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
