import 'package:flutter/material.dart';

import 'add_product_screen.dart';
import 'vendor_profile_screen.dart';

class VendorDashboardScreen extends StatelessWidget {
  const VendorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),

      appBar: AppBar(
        title: const Text(
          'Vendor Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF006A4E),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Welcome Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF006A4E),
                    Color(0xFF00A878),
                  ],
                ),

                borderRadius: BorderRadius.circular(20),
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Icon(
                    Icons.store,
                    color: Colors.white,
                    size: 40,
                  ),

                  SizedBox(height: 12),

                  Text(
                    'স্বাগতম, রহমান ফার্মেসি',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    'আপনার পণ্য সহজে ম্যানেজ করুন',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'দ্রুত কাজ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // Add Product
            _dashboardCard(
              context,
              icon: Icons.add_a_photo,
              title: 'নতুন পণ্য যোগ করুন',
              subtitle: 'ছবি তুলে দ্রুত স্টকে যোগ করুন',
              color: const Color(0xFF006A4E),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const AddProductScreen(),
                  ),
                );
              },
            ),

            // My Products
            _dashboardCard(
              context,
              icon: Icons.inventory_2_outlined,
              title: 'আমার পণ্য',
              subtitle: 'স্টকে থাকা পণ্য দেখুন',
              color: const Color(0xFF4D96FF),
              onTap: () {},
            ),

            // Vendor Profile
            _dashboardCard(
              context,
              icon: Icons.storefront,
              title: 'দোকানের প্রোফাইল',
              subtitle: 'দোকানের তথ্য পরিবর্তন করুন',
              color: const Color(0xFFFFA94D),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const VendorProfileScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            const Text(
              'আজকের তথ্য',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: _statCard(
                    'পণ্য',
                    '24',
                    Icons.inventory,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _statCard(
                    'মজুদ আছে',
                    '18',
                    Icons.check_circle,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _statCard(
                    'আজ যোগ',
                    '5',
                    Icons.add_circle,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _statCard(
                    'Views',
                    '126',
                    Icons.visibility,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _dashboardCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

      child: ListTile(
        onTap: onTap,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 7,
        ),

        leading: Container(
          width: 50,
          height: 50,

          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(14),
          ),

          child: Icon(
            icon,
            color: color,
            size: 27,
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        subtitle: Text(subtitle),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _statCard(
    String title,
    String value,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Icon(
            icon,
            color: const Color(0xFF006A4E),
          ),

          const SizedBox(height: 10),

          Text(
            value,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

