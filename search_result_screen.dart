import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/item_model.dart';
import 'item_details_screen.dart';

class SearchResultScreen extends StatelessWidget {
  final List<ItemModel> results;

  const SearchResultScreen({super.key, required this.results});

  // Call function
  Future<void> _makePhoneCall(String phone) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phone);

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
          'খোঁজার ফলাফল',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF006A4E),
        foregroundColor: Colors.white,
      ),

      body: results.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search_off, size: 70, color: Colors.grey),

                  SizedBox(height: 15),

                  Text(
                    'কোনো পণ্য পাওয়া যায়নি',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'অন্য কিছু দিয়ে আবার চেষ্টা করুন',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: results.length,

              itemBuilder: (context, index) {
                final item = results[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 14),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(16),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        // Top section
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Product Icon
                            Container(
                              width: 60,
                              height: 60,

                              decoration: BoxDecoration(
                                color: const Color(0xFFE8F5E9),
                                borderRadius: BorderRadius.circular(15),
                              ),

                              child: const Icon(
                                Icons.shopping_bag,
                                color: Color(0xFF006A4E),
                                size: 30,
                              ),
                            ),

                            const SizedBox(width: 14),

                            // Product Information
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  // Product Name
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 5),

                                  // Category
                                  Text(
                                    item.category,
                                    style: const TextStyle(
                                      color: Color(0xFF006A4E),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  const SizedBox(height: 7),

                                  // Shop Name
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.store,
                                        size: 16,
                                        color: Colors.grey,
                                      ),

                                      const SizedBox(width: 5),

                                      Expanded(
                                        child: Text(
                                          item.shopName,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 5),

                                  // Phone
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.phone,
                                        size: 16,
                                        color: Colors.grey,
                                      ),

                                      const SizedBox(width: 5),

                                      Text(
                                        item.phone,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 5),

                                  // Location
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: 16,
                                        color: Colors.red,
                                      ),

                                      const SizedBox(width: 3),

                                      Expanded(
                                        child: Text(
                                          item.location,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // Availability
                            Column(
                              children: [
                                Icon(
                                  item.available
                                      ? Icons.check_circle
                                      : Icons.cancel,
                                  color: item.available
                                      ? Colors.green
                                      : Colors.red,
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  item.available ? 'মজুদ আছে' : 'নেই',

                                  style: TextStyle(
                                    fontSize: 11,
                                    color: item.available
                                        ? Colors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // Description
                        Text(
                          item.description,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Price
                        Text(
                          '৳${item.price.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),

                        const SizedBox(height: 14),

                        // Buttons
                        Row(
                          children: [
                            // Details Button
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ItemDetailsScreen(item: item),
                                    ),
                                  );
                                },

                                icon: const Icon(Icons.info_outline, size: 18),

                                label: const Text('বিস্তারিত'),

                                style: OutlinedButton.styleFrom(
                                  foregroundColor: const Color(0xFF006A4E),

                                  side: const BorderSide(
                                    color: Color(0xFF006A4E),
                                  ),

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 10),

                            // Call Button
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: item.available
                                    ? () => _makePhoneCall(item.phone)
                                    : null,

                                icon: const Icon(Icons.call, size: 18),

                                label: const Text('কল করুন'),

                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF006A4E),

                                  foregroundColor: Colors.white,

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
