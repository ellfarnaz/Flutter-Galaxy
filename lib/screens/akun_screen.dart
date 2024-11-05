import 'package:flutter/material.dart';
import 'profile_screen.dart';
import '../widget/slide_page_route.dart';
import 'package:google_fonts/google_fonts.dart';

class AkunScreen extends StatelessWidget {
  const AkunScreen({super.key});

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.orbitron(color: Colors.white),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFF7B88FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0E1A),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              children: [
                // Profile Section
                Container(
                  width: 200,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C2033),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF7B88FF),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Profile Grid
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2C3E50),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 1,
                          physics: const NeverScrollableScrollPhysics(),
                          children: List.generate(
                            4,
                            (index) => Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFF7B88FF),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Name
                      Text(
                        'Fillah Aby P',
                        style: GoogleFonts.orbitron(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // University
                      Text(
                        'Universitas Teknologi Yogyakarta',
                        style: GoogleFonts.orbitron(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Menu Section
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C2033),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Material(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          _buildMenuItem(
                            context: context,
                            icon: Icons.manage_accounts,
                            iconColor: const Color(0xFF7B88FF),
                            title: 'Kelola Akun',
                            onTap: () {
                              Navigator.of(context).push(
                                  SlidePageRoute(page: const ProfileScreen()));
                            },
                            isFirstItem: true,
                          ),
                          _buildDivider(),
                          _buildMenuItem(
                            context: context,
                            icon: Icons.notifications_active,
                            iconColor: const Color(0xFFFFA726),
                            title: 'Notifikasi',
                            onTap: () =>
                                _showSnackBar(context, 'Notifikasi clicked'),
                          ),
                          _buildDivider(),
                          _buildMenuItem(
                            context: context,
                            icon: Icons.privacy_tip,
                            iconColor: const Color(0xFF66BB6A),
                            title: 'Privacy Policy',
                            onTap: () => _showSnackBar(
                                context, 'Privacy Policy clicked'),
                          ),
                          _buildDivider(),
                          _buildMenuItem(
                            context: context,
                            icon: Icons.description,
                            iconColor: const Color(0xFFAB47BC),
                            title: 'Terms of Service',
                            onTap: () => _showSnackBar(
                                context, 'Terms of Service clicked'),
                            isLastItem: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 1,
      thickness: 1,
      color: Color(0xFF2C3E50),
      indent: 16,
      endIndent: 16,
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
    bool isFirstItem = false,
    bool isLastItem = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.orbitron(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.white70,
            ),
          ],
        ),
      ),
    );
  }
}
