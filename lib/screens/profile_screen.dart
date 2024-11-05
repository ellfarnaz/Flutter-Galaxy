// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io' show Platform;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String _universityName = 'Universitas Teknologi Yogyakarta';

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _emailController.text = prefs.getString('email') ?? '';
      _nameController.text = prefs.getString('name') ?? 'Fillah Aby P';
      _phoneController.text = prefs.getString('phone') ?? '';
      _addressController.text = prefs.getString('address') ?? '';
      _universityName =
          prefs.getString('university') ?? 'Universitas Teknologi Yogyakarta';
    });
  }

  Future<void> _updateProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', _emailController.text);
    await prefs.setString('name', _nameController.text);
    await prefs.setString('phone', _phoneController.text);
    await prefs.setString('address', _addressController.text);

    setState(() {
      // Update the UI
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Profil berhasil diperbarui',
          style: GoogleFonts.orbitron(color: Colors.white),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFF7B88FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isIOS = Platform.isIOS;
    final double profileWidth = isIOS ? size.width * 0.5 : 200;
    final double fontSize = isIOS ? size.width * 0.05 : 20;
    final double padding = isIOS ? size.width * 0.05 : 20;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C2033),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF7B88FF)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Kelola Akun',
          style: GoogleFonts.orbitron(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFF0B0E1A),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Profile Section
                  Center(
                    child: Container(
                      width: profileWidth,
                      padding: EdgeInsets.all(padding * 0.8),
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
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Profile Icon
                          Container(
                            width: profileWidth * 0.8,
                            height: profileWidth * 0.8,
                            decoration: const BoxDecoration(
                              color: Color(0xFF2C3E50),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.person,
                              size: profileWidth * 0.4,
                              color: const Color(0xFF7B88FF),
                            ),
                          ),
                          SizedBox(height: padding * 0.8),
                          // Name
                          Text(
                            _nameController.text,
                            style: GoogleFonts.orbitron(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: padding * 0.4),
                          // University
                          Text(
                            _universityName,
                            style: GoogleFonts.orbitron(
                              fontSize: fontSize * 0.8,
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: padding * 1.2),
                  // Form Section
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 2,
                    color: const Color(0xFF1C2033),
                    child: Padding(
                      padding: EdgeInsets.all(padding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildTextField(context, 'Email',
                              TextInputType.emailAddress, _emailController),
                          SizedBox(height: padding * 0.8),
                          _buildTextField(context, 'Nama', TextInputType.name,
                              _nameController),
                          SizedBox(height: padding * 0.8),
                          _buildTextField(context, 'Nomor Telepon',
                              TextInputType.phone, _phoneController),
                          SizedBox(height: padding * 0.8),
                          _buildTextField(context, 'Alamat',
                              TextInputType.streetAddress, _addressController,
                              maxLines: 2),
                          SizedBox(height: padding * 1.2),
                          ElevatedButton(
                            onPressed: _updateProfile,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7B88FF),
                              padding: EdgeInsets.symmetric(
                                  vertical: padding * 0.75),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 2,
                            ),
                            child: Text(
                              'Ubah Profil',
                              style: GoogleFonts.orbitron(
                                fontSize: fontSize,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String label,
      TextInputType keyboardType, TextEditingController controller,
      {int maxLines = 1}) {
    final isIOS = Platform.isIOS;
    final size = MediaQuery.of(context).size;
    final double fontSize = isIOS ? size.width * 0.04 : 16;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.orbitron(
            fontSize: fontSize * 0.875,
            fontWeight: FontWeight.w500,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF2C3E50),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: isIOS ? 16 : 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFF7B88FF),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFF7B88FF),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFF7B88FF),
                width: 2,
              ),
            ),
          ),
          style: GoogleFonts.orbitron(
            fontSize: fontSize,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
