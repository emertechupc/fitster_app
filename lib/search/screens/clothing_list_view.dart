import 'package:flutter/material.dart';

import '../../utils/clothing_item.dart';
import 'item_view.dart';

class ClothingListView extends StatefulWidget {
  const ClothingListView({super.key});

  @override
  State<ClothingListView> createState() => _ClothingListViewState();
}

class _ClothingListViewState extends State<ClothingListView> {
  static const List<ClothingItem> clothingItems = [
    ClothingItem('assets/images/image_4.png', 'Men T-Shirt', 29.90),
    ClothingItem('assets/images/image_5.png', 'Woman T-Shirt', 29.90),
    ClothingItem('assets/images/image_6.png', 'Men T-Shirt', 29.90),
    ClothingItem('assets/images/image_7.png', 'Woman T-Shirt', 29.90),
    ClothingItem('assets/images/image_4.png', 'Men T-Shirt', 29.90),
    ClothingItem('assets/images/image_5.png', 'Woman T-Shirt', 29.90),
    ClothingItem('assets/images/image_6.png', 'Men T-Shirt', 29.90),
    ClothingItem('assets/images/image_7.png', 'Woman T-Shirt', 29.90),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fitster',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: SearchBar(
              leading: Icon(
                Icons.search,
              ),
              hintText: 'Search...',
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: clothingItems.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ItemView(),
                      ),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              clothingItems[index].imagePath,
                              width: 90,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            clothingItems[index].name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$${clothingItems[index].price.toString()}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
