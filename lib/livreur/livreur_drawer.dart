import 'package:flutter/material.dart';

class LivreurDrawer extends StatelessWidget {
  final VoidCallback? onClose;
  final VoidCallback? onProfil;
  final VoidCallback? onSolde;
  final VoidCallback? onCommandes;
  final VoidCallback? onHistoriques;
  final VoidCallback? onCommentaires;
  final VoidCallback? onLogout;
  final VoidCallback? onSupport;

  const LivreurDrawer({
    Key? key,
    this.onClose,
    this.onProfil,
    this.onSolde,
    this.onCommandes,
    this.onHistoriques,
    this.onCommentaires,
    this.onLogout,
    this.onSupport,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFFF5A1E),
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                // Avatar et nom
                Center(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            AssetImage('assets/images/livreur_avatar.png'),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Kome Bakary',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Livreur (L0001)',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Boutons
                _buildDrawerButton(
                  icon: Icons.person_outline,
                  label: 'Profil',
                  onTap: onProfil,
                ),
                _buildDrawerButton(
                  icon: Icons.attach_money,
                  label: 'Mon solde',
                  onTap: onSolde,
                ),
                _buildDrawerButton(
                  icon: Icons.delivery_dining,
                  label: 'Voir les commandes',
                  onTap: onCommandes,
                ),
                _buildDrawerButton(
                  icon: Icons.history,
                  label: 'Historiques',
                  onTap: onHistoriques,
                ),
                _buildDrawerButton(
                  icon: Icons.comment,
                  label: 'Commentaires',
                  onTap: onCommentaires,
                ),
                _buildDrawerButton(
                  icon: Icons.logout,
                  label: 'Se déconnecter',
                  onTap: onLogout,
                ),
                _buildDrawerButton(
                  icon: Icons.support_agent,
                  label: 'Centre d\'appel',
                  onTap: onSupport,
                ),
              ],
            ),
            // Bouton de fermeture (croix)
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: onClose ?? () => Navigator.of(context).pop(),
                child: const Icon(Icons.close, color: Colors.white, size: 32),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerButton({
    required IconData icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        label,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }
}
