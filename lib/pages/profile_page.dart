import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_1/global.dart' as globals;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    bool ubahtema = globals.ubahtema;
    Color textColor = ubahtema ? Colors.white : Colors.black;
    Color backgroundColor = ubahtema ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Text(
                'Profile',
                style: GoogleFonts.montserrat(
                  fontSize: 44,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              globals.profileImagePath != null
                  ? Image.file(
                      File(globals.profileImagePath!),
                      width: 200,
                      height: 250,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/profile.jpg',
                      width: 200,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
              const SizedBox(height: 16),
              Text(
                globals.profileName ?? 'Ridhuan Rangga Kusuma',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                globals.profileID ?? '1152200025',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
