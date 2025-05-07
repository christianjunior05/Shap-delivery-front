import 'package:flutter/material.dart';

Future<bool?> showConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (context) => Dialog(
      backgroundColor: const Color(0xFFFCEEEA),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(false),
                  child: const Icon(Icons.close, size: 28),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "Êtes-vous sûr(e) ?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text(
                    "Oui",
                    style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text(
                    "Non",
                    style: TextStyle(
                      color: Color(0xFFFF5A1E),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
