// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../widget/slide_page_route.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1C2033),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('Konfirmasi',
              style: GoogleFonts.orbitron(
                  color: Colors.white, fontWeight: FontWeight.bold)),
          content: Text('Apakah Anda yakin ingin keluar?',
              style: GoogleFonts.orbitron(color: Colors.white70, fontSize: 16)),
          actions: <Widget>[
            TextButton(
              child: Text('Batal',
                  style: GoogleFonts.orbitron(
                      color: const Color(0xFF7B88FF), fontSize: 18)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Keluar',
                  style: GoogleFonts.orbitron(
                      color: const Color(0xFF7B88FF), fontSize: 18)),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  SlidePageRoute(page: const LoginScreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0E1A),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.logout,
                  size: 100,
                  color: Color(0xFF7B88FF),
                ),
                const SizedBox(height: 30),
                Text(
                  'Keluar dari Aplikasi',
                  style: GoogleFonts.orbitron(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 4,
                  color: const Color(0xFF1C2033),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Tekan tombol di bawah untuk keluar dari aplikasi.',
                      style: GoogleFonts.orbitron(
                          fontSize: 18, color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7B88FF),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () => _showLogoutDialog(context),
                  child: Text('Keluar',
                      style: GoogleFonts.orbitron(
                          color: Colors.white, fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
