import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'কাছে কোথায় আছে?',

      theme: ThemeData(
        primaryColor: const Color(0xFF006A4E),

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF006A4E),
        ),

        useMaterial3: true,
      ),

      home: const LoginScreen(),
    );
  }
}

