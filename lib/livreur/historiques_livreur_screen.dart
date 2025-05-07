import 'package:flutter/material.dart';

class HistoriquesLivreurScreen extends StatelessWidget {
  const HistoriquesLivreurScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCEEEA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Historiques',
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
                _buildHistorique(
                  numero: '0012/L0001',
                  trajet: 'Riv Palm → Abobo Gare',
                  statut: 'En cours',
                  montant: '1 500 Fr cfa',
                ),
                _buildHistorique(
                  numero: '0212/L0001',
                  trajet: 'Riv Bonou → Yop Sable',
                  date: '26/02/2025',
                  montant: '2 500 Fr cfa',
                ),
                _buildHistorique(
                  numero: '1025/L0001',
                  trajet: 'Coc II Pla → Riv Palm',
                  date: '20/02/2025',
                  montant: '1 000 Fr cfa',
                ),
                _buildHistorique(
                  numero: '2135/L0001',
                  trajet: 'Yop Siproex → Riv Palm',
                  date: '01/02/2025',
                  montant: '3 000 Fr cfa',
                ),
                _buildHistorique(
                  numero: '2140/L0001',
                  trajet: 'Yop Siproex → Riv Palm',
                  statut: 'Annulé',
                  montant: '3 000 Fr cfa',
                  isAnnule: true,
                ),
                _buildHistorique(
                  numero: '3035/L0001',
                  trajet: 'Yop Selmer → Riv Faya',
                  statut: 'Annulé',
                  montant: '2 000 Fr cfa',
                  isAnnule: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5A1E),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: const Text(
                  'Valider',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistorique({
    required String numero,
    required String trajet,
    String? statut,
    String? date,
    required String montant,
    bool isAnnule = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset('assets/images/livraison_card.png', height: 32),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Commande n°',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: numero,
                        style: TextStyle(
                          color: isAnnule ? Colors.red : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(trajet, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          if (statut != null)
            Text(
              statut,
              style: TextStyle(
                color: isAnnule ? Colors.red : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          if (date != null)
            Text(
              date,
              style: const TextStyle(color: Colors.black54),
            ),
          const SizedBox(width: 10),
          Text(montant, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
