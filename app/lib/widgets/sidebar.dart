import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class Sidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const Sidebar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: AppColors.sidebarBackground,
      child: Column(
        children: [
          // Logo Consertech
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Row(
              children: [
                Icon(Icons.business, color: Colors.white, size: 28),
                SizedBox(width: 10),
                Text(
                  'Consertech',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Opciones del menú
          _buildMenuItem(0, Icons.dashboard, 'Dashboard'),
          _buildMenuItem(1, Icons.people, 'Visitas y Estacion...'),
          _buildMenuItem(2, Icons.inventory_2, 'Encomiendas'),
          _buildMenuItem(3, Icons.domain, 'Edificio y Residentes'),
          _buildMenuItem(4, Icons.analytics, 'Auditoría y Reportes'),

          const Spacer(), // Empuja lo demás hacia abajo
          // Perfil del Conserje
          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white24,
              child: Text('FL', style: TextStyle(color: Colors.white)),
            ),
            title: Text(
              'Fernando L.',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            subtitle: Text(
              'Turno Mañana',
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ),

          // Botones inferiores
          _buildMenuItem(
            5,
            Icons.settings,
            'Configuración',
            isBottomMenu: true,
          ),
          _buildMenuItem(
            6,
            Icons.logout,
            'Cerrar Sesión',
            isBottomMenu: true,
            isRed: true,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    int index,
    IconData icon,
    String title, {
    bool isBottomMenu = false,
    bool isRed = false,
  }) {
    final isSelected = selectedIndex == index && !isBottomMenu;

    return InkWell(
      onTap: () => onItemSelected(index),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isRed
                  ? Colors.redAccent
                  : (isSelected ? Colors.white : AppColors.textSecondary),
              size: 20,
            ),
            const SizedBox(width: 15),
            Text(
              title,
              style: TextStyle(
                color: isRed
                    ? Colors.redAccent
                    : (isSelected ? Colors.white : AppColors.textSecondary),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
