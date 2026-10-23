import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/item_model.dart';

class ItemDetailsScreen extends StatelessWidget {
  final ItemModel item;

  const ItemDetailsScreen({super.key, required this.item});

  Future<void> makePhoneCall() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: item.phone);

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),

      appBar: AppBar(
        title: const Text(
          'পণ্যের বিস্তারিত',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        backgroundColor: const Color(0xFF006A4E),

        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Product Header
            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),

                    blurRadius: 10,

                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,

                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),

                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: const Icon(
                      Icons.shopping_bag,
                      size: 45,

                      color: Color(0xFF006A4E),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    item.name,

                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    item.category,

                    style: const TextStyle(
                      color: Color(0xFF006A4E),

                      fontSize: 16,

                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    '৳${item.price.toStringAsFixed(0)}',

                    style: const TextStyle(
                      color: Colors.orange,

                      fontSize: 24,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),

                    decoration: BoxDecoration(
                      color: item.available
                          ? Colors.green.withOpacity(0.1)
                          : Colors.red.withOpacity(0.1),

                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Text(
                      item.available
                          ? '✓ বর্তমানে পাওয়া যাচ্ছে'
                          : '✕ বর্তমানে পাওয়া যাচ্ছে না',

                      style: TextStyle(
                        color: item.available ? Colors.green : Colors.red,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Description
            const Text(
              'পণ্যের বিবরণ',

              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(16),
              ),

              child: Text(
                item.description.isEmpty
                    ? 'কোনো বিবরণ দেওয়া হয়নি।'
                    : item.description,

                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Shop Information
            const Text(
              'দোকানের তথ্য',

              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(10),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(16),
              ),

              child: Column(
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFE8F5E9),

                      child: Icon(Icons.store, color: Color(0xFF006A4E)),
                    ),

                    title: const Text('দোকানের নাম'),

                    subtitle: Text(
                      item.shopName,

                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),

                  const Divider(),

                  ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFFFEBEE),

                      child: Icon(Icons.location_on, color: Colors.red),
                    ),

                    title: const Text('লোকেশন'),

                    subtitle: Text(item.location),
                  ),

                  const Divider(),

                  ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFE3F2FD),

                      child: Icon(Icons.phone, color: Colors.blue),
                    ),

                    title: const Text('ফোন'),

                    subtitle: Text(item.phone),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Call Button
            SizedBox(
              width: double.infinity,

              height: 54,

              child: ElevatedButton.icon(
                onPressed: item.available ? makePhoneCall : null,

                icon: const Icon(Icons.call),

                label: Text(
                  item.available ? 'দোকানে কল করুন' : 'পণ্যটি বর্তমানে নেই',

                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006A4E),

                  foregroundColor: Colors.white,

                  disabledBackgroundColor: Colors.grey,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
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
