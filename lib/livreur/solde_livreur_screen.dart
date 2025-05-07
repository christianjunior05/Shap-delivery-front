import 'package:flutter/material.dart';

class SoldeLivreurScreen extends StatelessWidget {
  const SoldeLivreurScreen({Key? key}) : super(key: key);

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
          'Mon solde',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text(
                '5 000 fr CFA',
                style: TextStyle(
                  color: Color(0xFFFF5A1E),
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Recharger mon compte',
                style: TextStyle(
                  color: Color(0xFFFF5A1E),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              _buildRechargeRow('MTN Mobile Money', '+225 05 05 00 00 00',
                  'assets/images/mtn.png'),
              _buildRechargeRow('Wave', 'Scanner moi', 'assets/images/wave.png',
                  isQr: true),
              _buildRechargeRow('Orange Money', '+225 07 07 00 00 00',
                  'assets/images/orange.png'),
              _buildRechargeRow('Moov Money', '+225 01 01 00 00 00',
                  'assets/images/moov.png'),
              const SizedBox(height: 24),
              const Text(
                'Historique de mes transactions',
                style: TextStyle(
                  color: Color(0xFFFF5A1E),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 12),
              _buildTransaction(
                  'Débit', 'Commande n°1010', '-500 Fr cfa', '02/02/2025'),
              _buildTransaction(
                  'Débit', 'Commande n°2035', '-1 500 Fr cfa', '02/02/2025'),
              _buildTransaction(
                  'Débit', 'Commande n°2135', '-3 000 Fr cfa', '02/02/2025'),
              _buildTransaction(
                  'Crédit', '05 05 00 00 00', '10 000 Fr cfa', '01/02/2025',
                  isCredit: true),
              const SizedBox(height: 32),
              SizedBox(
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
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRechargeRow(String label, String value, String asset,
      {bool isQr = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Image.asset(asset, height: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          if (isQr) const Icon(Icons.qr_code, size: 32, color: Colors.black54),
        ],
      ),
    );
  }

  Widget _buildTransaction(
      String type, String label, String amount, String date,
      {bool isCredit = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(Icons.attach_money, color: Color(0xFFFF5A1E)),
          const SizedBox(width: 8),
          Text(
            type,
            style: TextStyle(
              color: isCredit ? Colors.red : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(label,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Text(date, style: const TextStyle(color: Colors.black54)),
          const SizedBox(width: 8),
          Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
