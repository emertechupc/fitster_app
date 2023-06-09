import 'package:flutter/material.dart';

class Clothing {
  final String imagePath;
  final String name;
  final double price;

  Clothing(this.imagePath, this.name, this.price);
}

class ClothingListView extends StatefulWidget {
  const ClothingListView({super.key});

  @override
  State<ClothingListView> createState() => _ClothingListViewState();
}

class _ClothingListViewState extends State<ClothingListView> {
  final List<Clothing> clothingList = [
    Clothing('assets/images/image_4.png', 'Men T-Shirt', 29.90),
    Clothing('assets/images/image_5.png', 'Woman T-Shirt', 29.90),
    Clothing('assets/images/image_6.png', 'Men T-Shirt', 29.90),
    Clothing('assets/images/image_7.png', 'Woman T-Shirt', 29.90),
    Clothing('assets/images/image_4.png', 'Men T-Shirt', 29.90),
    Clothing('assets/images/image_5.png', 'Woman T-Shirt', 29.90),
    Clothing('assets/images/image_6.png', 'Men T-Shirt', 29.90),
    Clothing('assets/images/image_7.png', 'Woman T-Shirt', 29.90),
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
            child: Container(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: clothingList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10,20,10,10),
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              clothingList[index].imagePath,
                              width: 90,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            clothingList[index].name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$${clothingList[index].price.toString()}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
