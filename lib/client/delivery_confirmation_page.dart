import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'delivery_tracking_page.dart';

class DeliveryConfirmationPage extends StatefulWidget {
  const DeliveryConfirmationPage({Key? key}) : super(key: key);

  @override
  State<DeliveryConfirmationPage> createState() =>
      _DeliveryConfirmationPageState();
}

class _DeliveryConfirmationPageState extends State<DeliveryConfirmationPage> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _initializeMapData();
  }

  void _initializeMapData() {
    // Add delivery scooter marker at destination
    markers.add(
      const Marker(
        markerId: MarkerId('scooter'),
        position: LatLng(5.3684, -4.0283),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Arriver\nEn attente du destinataire...',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 4),
            Row(
              children: const [
                Text(
                  '02:10',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Text(
              'Votre livreur est arrivé à destination.\nVous pouvez le contacter...',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(5.3684, -4.0283),
                zoom: 15,
              ),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              markers: markers,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Suivi de la livraison',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildDeliveryInfo(
                  Icons.timer,
                  'Durée de la livraison',
                  '15-30 mins',
                ),
                _buildDeliveryInfo(
                  Icons.location_on,
                  'Adresse de départ',
                  'Cocody Riv Palmeraie',
                ),
                _buildDeliveryInfo(
                  Icons.location_on_outlined,
                  'Adresse de destination',
                  'Abobo Care Bingerville',
                ),
                _buildDeliveryInfo(
                  Icons.attach_money,
                  'Prix',
                  '2 500 Fr CFA',
                ),
                const SizedBox(height: 16),
                _buildDeliveryMan(),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DeliveryTrackingPage()),
                      );
                    },
                    child: const Text(
                      'Confirmer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      // Handle cancellation and return
                    },
                    child: const Text(
                      'Annuler et faire retourner le colis',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryInfo(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryMan() {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('assets/images/delivery_man.jpg'),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Kome Bakary',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Livreur (L0001)',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.phone, color: Colors.deepOrange),
          onPressed: () {
            // Handle phone call
          },
        ),
        IconButton(
          icon: const Icon(Icons.message, color: Colors.deepOrange),
          onPressed: () {
            // Handle message
          },
        ),
      ],
    );
  }
}
