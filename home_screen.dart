import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../all_items/all_items.dart';
import 'search_result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  String selectedCategory = 'সব';
  String selectedLocation = 'চাঁদপুর সদর';

  final List<String> categories = [
    'সব',
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

  void searchItems() {
    String searchText = searchController.text.trim().toLowerCase();

    List<ItemModel> results = allItems.where((item) {
      bool matchesSearch =
          searchText.isEmpty ||
          item.name.toLowerCase().contains(searchText) ||
          item.category.toLowerCase().contains(searchText);

      bool matchesCategory =
          selectedCategory == 'সব' || item.category == selectedCategory;

      bool matchesLocation = item.location == selectedLocation;

      bool matchesAvailability = item.available;

      return matchesSearch &&
          matchesCategory &&
          matchesLocation &&
          matchesAvailability;
    }).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultScreen(results: results),
      ),
    );
  }

  void searchByCategory(String category) {
    setState(() {
      selectedCategory = category;
    });

    List<ItemModel> results = allItems.where((item) {
      bool matchesCategory = category == 'সব' || item.category == category;

      bool matchesLocation = item.location == selectedLocation;

      bool matchesAvailability = item.available;

      return matchesCategory && matchesLocation && matchesAvailability;
    }).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultScreen(results: results),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),

                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF006A4E), Color(0xFF00A878)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'কাছে কোথায় আছে?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'আপনার প্রয়োজনীয় পণ্য বা সেবা খুঁজে নিন',
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),

                    const SizedBox(height: 22),

                    // Search Box
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: TextField(
                        controller: searchController,

                        decoration: const InputDecoration(
                          hintText: 'কি খুঁজছেন?',

                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFF006A4E),
                          ),

                          border: InputBorder.none,

                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                        ),

                        onSubmitted: (_) {
                          searchItems();
                        },
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Location Dropdown
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),

                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedLocation,
                          isExpanded: true,

                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF006A4E),
                          ),

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

                    const SizedBox(height: 12),

                    // Search Button
                    SizedBox(
                      width: double.infinity,
                      height: 52,

                      child: ElevatedButton.icon(
                        onPressed: searchItems,

                        icon: const Icon(Icons.search),

                        label: const Text(
                          'খুঁজুন',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFB703),
                          foregroundColor: Colors.black87,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Category Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),

                child: Text(
                  'ক্যাটাগরি নির্বাচন করুন',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 14),

              // Category Chips
              SizedBox(
                height: 45,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,

                  padding: const EdgeInsets.symmetric(horizontal: 20),

                  itemCount: categories.length,

                  itemBuilder: (context, index) {
                    final category = categories[index];

                    final selected = selectedCategory == category;

                    return Padding(
                      padding: const EdgeInsets.only(right: 10),

                      child: ChoiceChip(
                        label: Text(category),

                        selected: selected,

                        onSelected: (_) {
                          if (category == 'সব') {
                            searchByCategory('সব');
                          } else {
                            searchByCategory(category);
                          }
                        },

                        selectedColor: const Color(0xFF00A878),

                        backgroundColor: Colors.white,

                        labelStyle: TextStyle(
                          color: selected ? Colors.white : Colors.black87,

                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              // Popular Category Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),

                child: Text(
                  'জনপ্রিয় ক্যাটাগরি',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 15),

              // Popular Categories
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),

                child: GridView.count(
                  crossAxisCount: 3,

                  shrinkWrap: true,

                  physics: const NeverScrollableScrollPhysics(),

                  crossAxisSpacing: 12,

                  mainAxisSpacing: 12,

                  children: [
                    _categoryCard(
                      'খাবার',
                      Icons.restaurant,
                      const Color(0xFFFF6B6B),
                    ),

                    _categoryCard(
                      'ওষুধ',
                      Icons.medication,
                      const Color(0xFF4D96FF),
                    ),

                    _categoryCard(
                      'মুদি',
                      Icons.shopping_basket,
                      const Color(0xFFFFA94D),
                    ),

                    _categoryCard(
                      'কাপড়',
                      Icons.checkroom,
                      const Color(0xFFB197FC),
                    ),

                    _categoryCard(
                      'ইলেকট্রনিক্স',
                      Icons.devices,
                      const Color(0xFF20C997),
                    ),

                    _categoryCard(
                      'সেবা',
                      Icons.handyman,
                      const Color(0xFFFF8787),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryCard(String title, IconData icon, Color color) {
    return InkWell(
      onTap: () {
        searchByCategory(title);
      },

      borderRadius: BorderRadius.circular(18),

      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),

          borderRadius: BorderRadius.circular(18),

          border: Border.all(color: color.withOpacity(0.4)),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Icon(icon, color: color, size: 30),

            const SizedBox(height: 7),

            Text(
              title,
              textAlign: TextAlign.center,

              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
