import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'profile_screen.dart';
import 'add_product_screen.dart';
import 'vendor_profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    AddProductScreen(),
    VendorProfileScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,

        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        backgroundColor: Colors.white,

        indicatorColor: const Color(0xFFE0F2F1),

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: Color(0xFF006A4E)),
            label: 'হোম',
          ),

          NavigationDestination(
            icon: Icon(Icons.add_box_outlined),
            selectedIcon: Icon(Icons.add_box, color: Color(0xFF006A4E)),
            label: 'যোগ করুন',
          ),

          NavigationDestination(
            icon: Icon(Icons.store_outlined),
            selectedIcon: Icon(Icons.store, color: Color(0xFF006A4E)),
            label: 'ভেন্ডর',
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: Color(0xFF006A4E)),
            label: 'প্রোফাইল',
          ),
        ],
      ),
    );
  }
}
