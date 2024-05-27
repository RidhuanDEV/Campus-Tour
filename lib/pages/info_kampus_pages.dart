import 'package:app_1/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_1/global.dart' as globals;

class InfoKampus extends StatefulWidget {
  const InfoKampus({Key? key}) : super(key: key);

  @override
  State<InfoKampus> createState() => _InfoKampusState();
}

class _InfoKampusState extends State<InfoKampus> {
  void _keTourPage() {
    setState(() {
      globals.currentindex = 3;
      globals.indexStack.add(3);
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainPage()),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            item['image'].isNotEmpty
                ? Image.asset(
                    item['image'],
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                  )
                : Container(),
            const SizedBox(height: 20),
            Text(
              item['name'],
              style: GoogleFonts.montserrat(
                fontSize: 24,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              item['subtitle'],
              style: GoogleFonts.montserrat(fontSize: 18, color: textColor),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              onPressed: _keTourPage,
              child: Text(
                'Tour Ke Kampus ini',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
