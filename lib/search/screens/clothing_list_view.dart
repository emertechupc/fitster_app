import 'package:flutter/material.dart';

import '../../constants/clothing_items_data.dart';
import '../../utils/clothing_item.dart';
import 'item_view.dart';

class ClothingListView extends StatefulWidget {
  final String clothingItemsType;
  const ClothingListView({
    Key? key,
    required this.clothingItemsType,
  }) : super(key: key);

  @override
  State<ClothingListView> createState() => _ClothingListViewState();
}

class _ClothingListViewState extends State<ClothingListView> {

  List<ClothingItem> maleClothingItems = ClothingItemsData.maleClothingItems;
  List<ClothingItem> femaleClothingItems = ClothingItemsData.femaleClothingItems;
  List<ClothingItem> accessoriesClothingItems = ClothingItemsData.accessoriesClothingItems;

  _clothingItemType (String type){
    switch(type){
      case 'Male':
        return maleClothingItems;
        break;
      case 'Female':
        return femaleClothingItems;
        break;
      case 'Accessories':
        return accessoriesClothingItems;
        break;
      default:
        return maleClothingItems;
    }
  }

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
              itemCount: _clothingItemType(widget.clothingItemsType).length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemView(
                          productName: _clothingItemType(widget.clothingItemsType)[index].productName,
                          price: _clothingItemType(widget.clothingItemsType)[index].price.toString(),
                          productBrandModel: _clothingItemType(widget.clothingItemsType)[index].productBrandModel,
                          src3dModel: _clothingItemType(widget.clothingItemsType)[index].src3dModel
                        ),
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
                              _clothingItemType(widget.clothingItemsType)[index].imagePath,
                              width: 90,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            _clothingItemType(widget.clothingItemsType)[index].productName,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$${_clothingItemType(widget.clothingItemsType)[index].price.toString()}',
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
