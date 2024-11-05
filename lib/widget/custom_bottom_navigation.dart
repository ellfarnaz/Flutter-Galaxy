import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io' show Platform;

class CustomBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final double containerHeight = Platform.isIOS ? 100.0 : 70.0;

    return Theme(
      data: Theme.of(context).copyWith(
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return GoogleFonts.orbitron(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF7B88FF),
              );
            }
            return GoogleFonts.orbitron(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white70,
            );
          }),
        ),
      ),
      child: Container(
        height: containerHeight,
        decoration: BoxDecoration(
          color: const Color(0xFF1C2033),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: NavigationBar(
          onDestinationSelected: onItemSelected,
          selectedIndex: selectedIndex,
          indicatorColor: _getSelectedColor(selectedIndex),
          destinations: <Widget>[
            _buildNavigationDestination(
                Icons.home, Icons.home_outlined, 'Home', 0),
            _buildNavigationDestination(
                Icons.person, Icons.person_outline, 'Akun', 1),
            _buildNavigationDestination(
                Icons.logout, Icons.logout_outlined, 'Logout', 2),
          ],
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          height: 30,
          backgroundColor: const Color(0xFF1C2033),
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }

  NavigationDestination _buildNavigationDestination(
      IconData selectedIcon, IconData icon, String label, int index) {
    return NavigationDestination(
      icon: Icon(icon, color: Colors.white70),
      selectedIcon: Icon(selectedIcon, color: const Color(0xFF7B88FF)),
      label: label,
    );
  }

  Color _getSelectedColor(int index) {
    return const Color(0xFF0B0E1A);
  }
}
