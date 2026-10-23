import 'package:flutter/material.dart';

import '../models/item_model.dart';
import '../all_items/all_items.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  final TextEditingController shopNameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  String selectedCategory = 'খাবার';
  String selectedLocation = 'চাঁদপুর সদর';

  bool isAvailable = true;

  final List<String> categories = [
    'খাবার',
    'ওষুধ',
    'ইলেকট্রনিক্স',
    'মুদি',
    'কাপড়',
    'সেবা',
  ];

  final List<String> locations = [
    'চাঁদপুর সদর',
    'হাজীগঞ্জ',
    'ফরিদগঞ্জ',
    'মতলব উত্তর',
    'মতলব দক্ষিণ',
    'কচুয়া',
    'শাহরাস্তি',
  ];

  void addProduct() {
    if (productNameController.text.trim().isEmpty ||
        priceController.text.trim().isEmpty ||
        shopNameController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('দয়া করে প্রয়োজনীয় সব তথ্য পূরণ করুন')),
      );
      return;
    }

    double? price = double.tryParse(priceController.text.trim());

    if (price == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('সঠিক Price লিখুন')));
      return;
    }

    ItemModel newProduct = ItemModel(
      name: productNameController.text.trim(),
      category: selectedCategory,
      location: selectedLocation,
      shopName: shopNameController.text.trim(),
      phone: phoneController.text.trim(),
      description: descriptionController.text.trim(),
      price: price,
      available: isAvailable,
    );

    allItems.add(newProduct);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Product successfully added!')),
    );

    productNameController.clear();
    priceController.clear();
    shopNameController.clear();
    phoneController.clear();
    descriptionController.clear();

    setState(() {
      selectedCategory = 'খাবার';
      selectedLocation = 'চাঁদপুর সদর';
      isAvailable = true;
    });
  }

  @override
  void dispose() {
    productNameController.dispose();
    priceController.dispose();
    shopNameController.dispose();
    phoneController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'নতুন Product যোগ করুন',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: productNameController,
              decoration: const InputDecoration(
                labelText: 'Product Name',
                hintText: 'যেমন: প্যারাসিটামল',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // Category Dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedCategory,
                  isExpanded: true,
                  items: categories.map((category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedCategory = value;
                      });
                    }
                  },
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Price',
                hintText: 'যেমন: 100',
                prefixText: '৳ ',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // Location Dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedLocation,
                  isExpanded: true,
                  items: locations.map((location) {
                    return DropdownMenuItem<String>(
                      value: location,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(location),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedLocation = value;
                      });
                    }
                  },
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: shopNameController,
              decoration: const InputDecoration(
                labelText: 'Shop Name',
                hintText: 'দোকানের নাম',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                hintText: '01XXXXXXXXX',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Product সম্পর্কে লিখুন',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                'Product Available',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              value: isAvailable,
              onChanged: (value) {
                setState(() {
                  isAvailable = value;
                });
              },
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: addProduct,
                child: const Text(
                  'Add Product',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
