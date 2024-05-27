import 'dart:io';

import 'package:app_1/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_1/global.dart' as globals;

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  File? _profileImage;

  @override
  void initState() {
    super.initState();
    _nameController.text = globals.profileName ?? '';
    _idController.text = globals.profileID ?? '';
    if (globals.profileImagePath != null) {
      _profileImage = File(globals.profileImagePath!);
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool ubahtema = globals.ubahtema;
    Color textColor = ubahtema ? Colors.white : Colors.black;
    Color backgroundColor = ubahtema ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Update Profile',
          style: TextStyle(color: textColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: _profileImage != null
                      ? FileImage(_profileImage!)
                      : const AssetImage('assets/profile.jpg') as ImageProvider,
                  child: _profileImage == null
                      ? Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                          size: 50,
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: textColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                  ),
                ),
                style: TextStyle(color: textColor),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _idController,
                decoration: InputDecoration(
                  labelText: 'ID',
                  labelStyle: TextStyle(color: textColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                  ),
                ),
                style: TextStyle(color: textColor),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    globals.profileName = _nameController.text;
                    globals.profileID = _idController.text;
                    if (_profileImage != null) {
                      globals.profileImagePath = _profileImage!.path;
                    }
                    globals.currentindex = 1; 
                    Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainPage()),
                );
                  });
                },
                child: Text(
                  'Save',
                  style: GoogleFonts.montserrat(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
