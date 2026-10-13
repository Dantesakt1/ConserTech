import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../widgets/sidebar.dart';
import 'dashboard_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  // Lista de las pantallas que se mostrarán a la derecha
  final List<Widget> _screens = [
    const DashboardScreen(),
    const Center(child: Text('Configuración')), // Placeholder para index 5
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: Row(
        children: [
          // Menú Lateral (Izquierda)
          Sidebar(
            selectedIndex: _selectedIndex,
            onItemSelected: (index) {
              if (index == 6) {
                // Lógica de cerrar sesión aquí en el futuro
                print("Cerrando sesión...");
                return;
              }
              setState(() {
                _selectedIndex = index;
              });
            },
          ),

          // Pantalla Principal (Derecha)
          Expanded(child: _screens[_selectedIndex]),
        ],
      ),
    );
  }
}
