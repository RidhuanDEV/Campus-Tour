import 'package:app_1/pages/settings.dart';
import 'package:app_1/pages/update_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:app_1/pages/tour_page.dart';
import 'package:app_1/pages/home_page.dart';
import 'package:app_1/pages/info_kampus_pages.dart';
import 'package:app_1/pages/profile_page.dart';
import 'package:app_1/global.dart' as globals;
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _children = const [
    HomePage(),
    ProfilePage(),
    InfoKampus(),
    TourPage(),
    SettingsPage(),
    UpdateProfilePage(),
  ];

  void onTaptapped(int index) {
    setState(() {
      globals.currentindex = index;
      globals.indexStack.add(index);
    });
  }

  void ontapped(int index) {
    setState(() {
      globals.kampusindex = index;
      globals.currentindex = 2;
      globals.indexStack.add(2);
    });
  }

  void onClosePressed() {
    setState(() {
      if (globals.indexStack.length > 1) {
        globals.indexStack.removeLast();
        globals.currentindex = globals.indexStack.last;
      }
    });
  }

  List<Map<String, dynamic>> filteredItems = [];

  @override
  void initState() {
    filteredItems = List.from(globals.items);
    super.initState();
  }

  void filterList(String query) {
    setState(() {
      filteredItems = globals.items
          .where((item) =>
              item['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool ubahtema = globals.ubahtema;
    Color backgroundColor = ubahtema ? Colors.black : Colors.white;
    Color textColor = ubahtema ? Colors.white : Colors.black;
    Color appBarColor = ubahtema ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        iconTheme: IconThemeData(
          color: ubahtema ? Colors.white : Colors.black,
        ),
        leading: (globals.currentindex == 0 ||
                globals.currentindex == 2 ||
                globals.currentindex == 3)
            ? IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  onTaptapped(9);
                },
              )
            : IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  onClosePressed();
                },
              ),
        actions: (globals.currentindex == 0 ||
                globals.currentindex == 2 ||
                globals.currentindex == 3)
            ? [
                GestureDetector(
                  onTap: () {
                    onTaptapped(1);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0), 
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey.shade200,
                          child: const CircleAvatar(
                            radius: 18,
                            backgroundImage: AssetImage('assets/profile.jpg'),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: backgroundColor,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                              color: backgroundColor,
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(2, 4),
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]
            : null,
      ),
      body: (globals.currentindex == 9)
          ? SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      title: Center(
                        child: Text(
                          "Explore",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onTap: () {
                        onTaptapped(0);
                      },
                    ),
                    ListTile(
                      title: Center(
                        child: Text(
                          "Profile",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onTap: () {
                        onTaptapped(1);
                      },
                    ),
                    ListTile(
                      title: Center(
                        child: Text(
                          "Settings",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onTap: () {
                        onTaptapped(4);
                      },
                    ),
                  ],
                ),
              ),
            )
          : (globals.currentindex == 0)
              ? SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: Text(
                          'Explore',
                          style: GoogleFonts.montserrat(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: TextField(
                          onChanged: (value) {
                            filterList(value);
                          },
                          decoration: InputDecoration(
                            hintText: 'Cari Kampus...',
                            hintStyle:
                                TextStyle(color: textColor.withOpacity(0.6)),
                            prefixIcon: Icon(Icons.search,
                                color: textColor.withOpacity(0.6)),
                            filled: true,
                            fillColor: backgroundColor,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: textColor.withOpacity(0.6)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: textColor.withOpacity(0.6)),
                            ),
                          ),
                          style: TextStyle(color: textColor),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: filteredItems.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                ontapped(filteredItems[index]['index']);
                              },
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 10),
                                title: SizedBox(
                                  width: 330,
                                  height: 225,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        filteredItems[index]['image'],
                                        width: 330,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        filteredItems[index]['name'],
                                        style: TextStyle(
                                            fontSize: 20, color: textColor,fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        filteredItems[index]['subtitle'],
                                        style: TextStyle(
                                            fontSize: 14, color: textColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : _children[globals.currentindex],
    );
  }
}
