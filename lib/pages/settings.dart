import 'package:app_1/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:app_1/global.dart' as globals;
import 'package:flutter/services.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool ubahtema = globals.ubahtema;

  void ubahTema(bool value) {
    setState(() {
      ubahtema = value;
      globals.ubahtema = value;
    });
  }

  void navigateToUpdateProfile() {
    setState(() {
      globals.currentindex = 5;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ubahtema ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: ubahtema ? Colors.black : Colors.white,
        iconTheme: IconThemeData(color: ubahtema ? Colors.white : Colors.black),
        title: Text(
          'Settings',
          style: TextStyle(color: ubahtema ? Colors.white : Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListTile(
            title: Text(
              'Dark/Light Mode',
              style: TextStyle(color: ubahtema ? Colors.white : Colors.black),
            ),
            trailing: Switch(
              value: ubahtema,
              onChanged: ubahTema,
              activeColor: Colors.orange,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: navigateToUpdateProfile,
                    child: const Text(
                      'Update Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Konfirmasi'),
                            content: const Text(
                                'Apakah anda ingin keluar aplikasi?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Batalkan'),
                              ),
                              TextButton(
                                onPressed: () {
                                  SystemNavigator.pop();
                                },
                                child: const Text('Keluar'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text(
                      'Keluar Aplikasi',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
