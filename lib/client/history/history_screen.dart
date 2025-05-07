import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  Widget _buildDeliveryItem({
    required String commandNumber,
    required String from,
    required String to,
    required String date,
    required String price,
    String? status,
  }) {
    final isOngoing = status == 'En cours';
    final isCancelled = status == 'Annulé';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          const Icon(Icons.delivery_dining, color: Color(0xFFFF5722), size: 30),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Commande n°$commandNumber',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (status != null)
                      Text(
                        status,
                        style: TextStyle(
                          color: isOngoing
                              ? Colors.blue
                              : isCancelled
                                  ? Colors.red
                                  : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
                Text('$from → $to'),
                if (date.isNotEmpty) Text(date),
                Text('$price Fr cfa'),
              ],
            ),
          ),
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
          'Historiques',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildDeliveryItem(
              commandNumber: '',
              from: '',
              to: '',
              date: '',
              price: '',
              status: '',
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
                  'Valider',
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
