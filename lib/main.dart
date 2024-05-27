import 'package:flutter/material.dart';
import 'package:app_1/pages/main_page.dart';
import 'package:app_1/pages/settings.dart';
import 'package:app_1/global.dart' as globals;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainPage(),
      theme: globals.ubahtema ? ThemeData.dark() : ThemeData.light(),
      routes: {
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
