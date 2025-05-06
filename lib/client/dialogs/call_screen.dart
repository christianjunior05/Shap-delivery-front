import 'package:flutter/material.dart';
import 'dart:async';

class CallScreen extends StatefulWidget {
  final String phoneNumber;
  final String livreurName;

  const CallScreen(
      {Key? key, required this.phoneNumber, required this.livreurName})
      : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  bool isMuted = false;
  bool isSpeakerOn = false;
  String callTime = "01:12";
  late Timer _timer;
  int _seconds = 72; // 01:12 en secondes
  bool isCallConnected = true;
  String callStatus = "Appel en cours";

  @override
  void initState() {
    super.initState();
    _startTimer();
    _simulateCallConnection();
  }

  void _simulateCallConnection() {
    // Simuler un appel en cours
    setState(() {
      callStatus = "Connexion en cours...";
    });

    // Simuler que l'appel est connecté après 1 seconde
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          callStatus = "Appel connecté";
          isCallConnected = true;
        });
      }
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _seconds++;
          int minutes = _seconds ~/ 60;
          int seconds = _seconds % 60;
          callTime =
              "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              widget.phoneNumber,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              callTime,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              callStatus,
              style: TextStyle(
                fontSize: 14,
                color: isCallConnected ? Colors.green : Colors.orange,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  widget.livreurName.substring(0, 1),
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildActionButton(
                  icon: Icons.volume_up,
                  label: "Haut parleur",
                  isActive: isSpeakerOn,
                  onTap: () {
                    setState(() {
                      isSpeakerOn = !isSpeakerOn;
                    });
                  },
                ),
                const SizedBox(width: 60),
                _buildActionButton(
                  icon: Icons.mic_off,
                  label: "Silence",
                  isActive: isMuted,
                  onTap: () {
                    setState(() {
                      isMuted = !isMuted;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.call_end,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: isActive ? Colors.grey[400] : Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isActive ? Colors.black : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.black : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
