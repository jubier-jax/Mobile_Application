import 'package:flutter/material.dart';

import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),

      appBar: AppBar(
        title: const Text(
          'আমার প্রোফাইল',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF006A4E),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFFE0F2F1),
              child: Icon(Icons.person, size: 55, color: Color(0xFF006A4E)),
            ),

            const SizedBox(height: 15),

            const Text(
              'Bayjid Jubeir',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            const Text(
              'User / Vendor',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),

            const SizedBox(height: 25),

            Card(
              elevation: 0,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.person_outline,
                      color: Color(0xFF006A4E),
                    ),
                    title: const Text('নাম'),
                    subtitle: const Text('Bayjid Jubeir'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Edit Name coming soon')),
                      );
                    },
                  ),

                  const Divider(height: 1),

                  ListTile(
                    leading: const Icon(
                      Icons.phone_outlined,
                      color: Color(0xFF006A4E),
                    ),
                    title: const Text('ফোন নম্বর'),
                    subtitle: const Text('01XXXXXXXXX'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Edit Phone coming soon')),
                      );
                    },
                  ),

                  const Divider(height: 1),

                  ListTile(
                    leading: const Icon(
                      Icons.location_on_outlined,
                      color: Color(0xFF006A4E),
                    ),
                    title: const Text('লোকেশন'),
                    subtitle: const Text('চাঁদপুর সদর'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Edit Location coming soon'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Card(
              elevation: 0,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.settings_outlined,
                      color: Colors.grey,
                    ),
                    title: const Text('Settings'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Settings coming soon')),
                      );
                    },
                  ),

                  const Divider(height: 1),

                  ListTile(
                    leading: const Icon(Icons.help_outline, color: Colors.grey),
                    title: const Text('Help & Support'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Help & Support coming soon'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return AlertDialog(
                        title: const Text('Logout'),
                        content: const Text('আপনি কি Logout করতে চান?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(dialogContext);
                            },
                            child: const Text('না'),
                          ),

                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(dialogContext);

                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                                (route) => false,
                              );
                            },
                            child: const Text('হ্যাঁ'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.logout),
                label: const Text('Logout', style: TextStyle(fontSize: 16)),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
