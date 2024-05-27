import 'package:app_1/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_1/global.dart' as globals;

class TourPage extends StatefulWidget {
  const TourPage({Key? key}) : super(key: key);

  @override
  State<TourPage> createState() => _TourPageState();
}

class _TourPageState extends State<TourPage> {
  bool _switchValue1 = false;
  bool _switchValue2 = false;
  bool _isChecked = false;

  void _bookingnotifikasi() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: globals.ubahtema ? Colors.black : Colors.white,
          title: Text(
            'Sudah di Confirm !',
            style: GoogleFonts.montserrat(
                color: globals.ubahtema ? Colors.white : Colors.black),
          ),
          content: Text(
            'Selamat Tour telah di Booking.',
            style: GoogleFonts.montserrat(
                color: globals.ubahtema ? Colors.white : Colors.black),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
                setState(() {
                  globals.currentindex =
                      0;
                });
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainPage()),
                );
              },
              child: Text(
                'OK',
                style: GoogleFonts.montserrat(
                    color: globals.ubahtema ? Colors.white : Colors.black,
                    fontSize: 17),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> item = globals.items.firstWhere(
      (item) => item['index'] == globals.kampusindex,
      orElse: () => {'name': 'Item not found', 'image': '', 'subtitle': ''},
    );

    bool ubahtema = globals.ubahtema;
    Color textColor = ubahtema ? Colors.white : Colors.black;
    Color backgroundColor = ubahtema ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Summary of your tour to campus ${item['name']}',
                    style: GoogleFonts.montserrat(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: textColor),
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset(
                  item['image'],
                  width: 130,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Apa anda ingin menerima update booking?',
                    style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor),
                  ),
                ),
                Switch(
                  value: _switchValue1,
                  onChanged: (value) {
                    setState(() {
                      _switchValue1 = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Apa anda ingin menjadi prioritas booking?',
                    style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor),
                  ),
                ),
                Switch(
                  value: _switchValue2,
                  onChanged: (value) {
                    setState(() {
                      _switchValue2 = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    'I agree to the terms and conditions',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Center(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: _isChecked ? Colors.orange : Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ElevatedButton(
                  onPressed: _isChecked ? _bookingnotifikasi : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Text(
                    'Confirm Booking',
                    style: GoogleFonts.montserrat(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
