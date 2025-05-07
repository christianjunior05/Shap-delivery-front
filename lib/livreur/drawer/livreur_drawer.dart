import 'package:flutter/material.dart';

class LivreurDrawer extends StatelessWidget {
  const LivreurDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFFFCEEEA),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFFFF5A1E),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child:
                        Icon(Icons.person, size: 40, color: Color(0xFFFF5A1E)),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Kome Bakary',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Livreur L0001',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
              icon: Icons.person_outline,
              title: 'Profil',
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to profile
              },
            ),
            _buildDrawerItem(
              icon: Icons.account_balance_wallet_outlined,
              title: 'Solde',
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to balance
              },
            ),
            _buildDrawerItem(
              icon: Icons.list_alt_outlined,
              title: 'Commandes',
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to commands
              },
            ),
            _buildDrawerItem(
              icon: Icons.history,
              title: 'Historique',
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to history
              },
            ),
            _buildDrawerItem(
              icon: Icons.comment_outlined,
              title: 'Commentaires',
              onTap: () {
                Navigator.pop(context);
                // Already on comments page
              },
            ),
            _buildDrawerItem(
              icon: Icons.logout,
              title: 'Déconnexion',
              onTap: () {
                Navigator.pop(context);
                // TODO: Handle logout
              },
            ),
            _buildDrawerItem(
              icon: Icons.support_agent,
              title: 'Support',
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to support
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFFFF5A1E)),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 16,
        ),
      ),
      onTap: onTap,
    );
  }
}
