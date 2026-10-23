import 'package:flutter/material.dart';

import '../models/item_model.dart';
import '../all_items/all_items.dart';
import 'item_details_screen.dart';

class VendorProfileScreen extends StatelessWidget {
  const VendorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ItemModel> myProducts = allItems.where((item) {
      return item.shopName == 'My Shop';
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendor Profile'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.store,
                size: 50,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'My Shop',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Vendor',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('Location'),
                      subtitle: Text('Chandpur Sadar'),
                    ),

                    const Divider(),

                    const ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Phone'),
                      subtitle: Text('01XXXXXXXXX'),
                    ),

                    const Divider(),

                    const ListTile(
                      leading: Icon(Icons.store),
                      title: Text('Shop Name'),
                      subtitle: Text('My Shop'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'My Products',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            if (myProducts.isEmpty)
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'এখনো কোনো Product যোগ করা হয়নি',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: myProducts.length,
                itemBuilder: (context, index) {
                  final item = myProducts[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xFFE8F5E9),
                        child: Icon(
                          Icons.shopping_bag,
                          color: Color(0xFF006A4E),
                        ),
                      ),

                      title: Text(
                        item.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      subtitle: Text(
                        '${item.category} • ৳${item.price.toStringAsFixed(0)}',
                      ),

                      trailing: Icon(
                        item.available
                            ? Icons.check_circle
                            : Icons.cancel,
                        color: item.available
                            ? Colors.green
                            : Colors.red,
                      ),

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ItemDetailsScreen(item: item),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Edit Profile coming soon'),
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
