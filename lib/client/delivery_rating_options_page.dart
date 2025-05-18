import 'package:flutter/material.dart';

class DeliveryRatingOptionsPage extends StatefulWidget {
  const DeliveryRatingOptionsPage({Key? key}) : super(key: key);

  @override
  State<DeliveryRatingOptionsPage> createState() =>
      _DeliveryRatingOptionsPageState();
}

class _DeliveryRatingOptionsPageState extends State<DeliveryRatingOptionsPage> {
  final TextEditingController _commentController = TextEditingController();
  final List<String> _ratingOptions = [
    'Long temps d\'attente',
    'Livreur désagréable',
    'Changement d\'avis',
    'Prix élevé',
  ];
  String? _selectedOption;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Annulation',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/gbedolo_kan.jpg'),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Gbedolo Kan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 32),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _ratingOptions.length,
              itemBuilder: (context, index) {
                final option = _ratingOptions[index];
                return RadioListTile<String>(
                  title: Text(
                    option,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  value: option,
                  groupValue: _selectedOption,
                  activeColor: Colors.deepOrange,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value;
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Souhaitez-vous en dire plus ?',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _commentController,
                maxLines: 4,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Laisser un commentaire...',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Boutons d'action
            Row(
              children: [
                // Bouton d'annulation
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.deepOrange),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Annulation',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Bouton d'envoi
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Redirection vers la page d'accueil
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: const Text(
                      'Envoyer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
