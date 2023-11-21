import 'package:flutter/material.dart';
import '../../utils/clothing_item.dart';
import '../model/product.dart';
import '../services/product_service.dart';
import 'item_view.dart';
import '../../constants/clothing_items_data.dart';
import 'item_view_3d.dart';

class ClothingListView extends StatefulWidget {
  final int genderId;
  final int brandId;
  final int categoryId;
  final bool isGenderId;
  final bool isBrandId;
  final bool isCategoryId;
  const ClothingListView({
    super.key,
    required this.brandId,
    required this.isBrandId,
    required this.categoryId,
    required this.isCategoryId,
    required this.genderId,
    required this.isGenderId,
  });

  @override
  State<ClothingListView> createState() => _ClothingListViewState();
}

class _ClothingListViewState extends State<ClothingListView> {
  final productService = ProductService();
  List<ClothingItem> maleClothingItems = ClothingItemsData.maleClothingItems;
  List<ClothingItem> femaleClothingItems =
      ClothingItemsData.femaleClothingItems;

  List<dynamic> listaFinal = [];
  clothingItemType(int type) {
    switch (type) {
      case 1:
        return maleClothingItems;
      case 2:
        return femaleClothingItems;
      default:
        return femaleClothingItems;
    }
  }

  @override
  Widget build(BuildContext context) {
    final productFuture = productService.getAllProducts();
    late List<dynamic>? data;
    late List<dynamic>? localData;

    return FutureBuilder(
      future: productFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final products = snapshot.data;
          if (widget.isGenderId) {
            data = products
                ?.where((element) => element.genderId == widget.genderId)
                .toList();
            localData = clothingItemType(widget.genderId);
            //data?.add(localData?[0]);
            listaFinal.addAll(data!);
            listaFinal.addAll(localData!);
          }
          if (widget.isBrandId) {
            data = products
                ?.where((element) => element.brandId == widget.brandId)
                .toList();
            localData = maleClothingItems
                .where((element) => element.brandId == widget.brandId)
                .toList();
            localData?.addAll(femaleClothingItems
                .where((element) => element.brandId == widget.brandId)
                .toList());
            listaFinal.addAll(data!);
            listaFinal.addAll(localData!);
          }
          if (widget.isCategoryId) {
            data = products
                ?.where((element) => element.categoryId == widget.categoryId)
                .toList();
            localData = maleClothingItems
                .where((element) => element.categoryId == widget.categoryId)
                .toList();
            localData?.addAll(femaleClothingItems
                .where((element) => element.categoryId == widget.categoryId)
                .toList());
            listaFinal.addAll(data!);
            listaFinal.addAll(localData!);
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Fitster',
              ),
              centerTitle: true,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: listaFinal.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          var selectedItem = listaFinal[index];

                          if (selectedItem is Product) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ItemView(product: selectedItem),
                              ),
                            );
                          } else if (selectedItem is ClothingItem) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ItemView3d(
                                  src3dModel: listaFinal[index].model3D,
                                  productName: listaFinal[index].name,
                                  price: listaFinal[index].price.toString(),
                                  productBrandModel:
                                      listaFinal[index].productBrandModel,
                                  rating: listaFinal[index].rating,
                                ),
                              ),
                            );
                          }
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                            child: Column(
                              children: [
                                Expanded(
                                  child: listaFinal[index] is Product
                                      ? Image.network(
                                          listaFinal[index].image,
                                          width: 70,
                                          height: 120,
                                          fit: BoxFit.fill,
                                        )
                                      : listaFinal[index] is ClothingItem
                                          ? Image.asset(
                                              listaFinal[index].image,
                                              fit: BoxFit.fill,
                                            )
                                          : Container(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  listaFinal[index].name,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'S/. ${listaFinal[index].price}',
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
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Fitster',
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'home');
                },
                icon: Icon(Icons.arrow_back),
              ),
              centerTitle: true,
            ),
            body: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
          );
        }
      },
    );
  }
}
