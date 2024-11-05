// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'akun_screen.dart';
import 'logout_screen.dart';
import '../widget/custom_bottom_navigation.dart';
import 'home_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _previousIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(),
    const AkunScreen(),
    const LogoutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF0B0E1A), // Dark background for galaxy theme
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 300),
        reverse: _selectedIndex < _previousIndex,
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: CustomBottomNavigation(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _previousIndex = _selectedIndex;
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
