import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDialog extends StatelessWidget {
  const ContactDialog({super.key});

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  Widget _buildContactItem(
      IconData icon, String text, Color iconColor, String url) {
    return InkWell(
      onTap: () => _launchUrl(url),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(width: 15),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.blue,
                // Suppression de: decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
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
              'tel:0505050505',
            ),
            _buildContactItem(
              Icons.message,
              '07 07 07 07 07',
              Colors.green,
              'sms:0707070707',
            ),
            _buildContactItem(
              Icons.mail_outline,
              'shap@gmail.com',
              Colors.red,
              'mailto:shap@gmail.com',
            ),
          ],
        ),
      ),
    );
  }
}
