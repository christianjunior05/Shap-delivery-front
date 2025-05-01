import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'cancel_confirmation_dialog.dart';
import 'new_order_dialog.dart';
import 'real_time_tracking_screen.dart';

class DeliveryTrackingScreen extends StatelessWidget {
  const DeliveryTrackingScreen({super.key});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  Future<void> _sendMessage(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  Future<void> _handleCancel(BuildContext context) async {
    final bool? shouldCancel = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => const CancelConfirmationDialog(),
    );

    if (shouldCancel == true) {
      final bool? shouldNewOrder = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) => const NewOrderDialog(),
      );

      if (shouldNewOrder == true) {
        // Rediriger vers la page de nouvelle commande
        Navigator.of(context).pushReplacementNamed('/new_order');
      } else {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // En-tête orange
            Container(
              color: const Color(0xFFFF5722),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'En route pour le lieu\nde prise en charge...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      'Votre demande a été prise en compte.\nLe livreur est en route vers\nle lieu de prise en charge...',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            // Carte
            Expanded(
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(5.3484, -4.0305), // Abidjan coordinates
                      zoom: 14,
                    ),
                    polylines: {
                      const Polyline(
                        polylineId: PolylineId('delivery_route'),
                        color: Color(0xFFFF5722),
                        width: 4,
                        points: [], // Points to be added dynamically
                      ),
                    },
                    markers: {
                      const Marker(
                        markerId: MarkerId('pickup'),
                        position: LatLng(5.3484, -4.0305),
                      ),
                      const Marker(
                        markerId: MarkerId('delivery'),
                        position: LatLng(5.3584, -4.0405),
                      ),
                    },
                  ),
                ],
              ),
            ),

            // Détails de la livraison
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Suivi de la livraison',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildDeliveryDetail(
                    icon: Icons.access_time,
                    title: 'Durée de la livraison',
                    value: '',
                  ),
                  _buildDeliveryDetail(
                    icon: Icons.location_on,
                    title: 'Adresse de départ',
                    value: '',
                  ),
                  _buildDeliveryDetail(
                    icon: Icons.location_on,
                    title: 'Adresse de destination',
                    value: '',
                    showModifier: true,
                    onModifierPressed: () {
                      // Implémenter la modification d'adresse
                    },
                  ),
                  _buildDeliveryDetail(
                    icon: Icons.attach_money,
                    title: 'Prix',
                    value: '',
                  ),
                  const SizedBox(height: 16),
                  // Informations du livreur
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          'assets/images/driver_avatar.png',
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kome Bakary',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Livreur (L0001)',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.phone, color: Color(0xFFFF5722)),
                        onPressed: () => _makePhoneCall('+22500000000'),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.message,
                          color: Color(0xFFFF5722),
                        ),
                        onPressed: () => _sendMessage('+22500000000'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const RealTimeTrackingScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF5722),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Suivre',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: TextButton(
                      onPressed: () => _handleCancel(context),
                      child: const Text(
                        'Annuler',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryDetail({
    required IconData icon,
    required String title,
    required String value,
    bool showModifier = false,
    VoidCallback? onModifierPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (showModifier)
                      TextButton(
                        onPressed: onModifierPressed,
                        child: const Text(
                          'Modifier',
                          style: TextStyle(
                            color: Color(0xFFFF5722),
                            fontSize: 14,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
