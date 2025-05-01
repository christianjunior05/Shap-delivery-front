import 'package:flutter/material.dart';

class ContactDialog extends StatelessWidget {
  const ContactDialog({super.key});

  Widget _buildContactItem(IconData icon, String text, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(width: 15),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Contacter nous au :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildContactItem(
              Icons.phone,
              '05 05 05 05 05',
              Colors.blue,
            ),
            _buildContactItem(
              Icons.message,
              '07 07 07 07 07',
              Colors.green,
            ),
            _buildContactItem(
              Icons.mail_outline,
              'shap@gmail.com',
              Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
