import 'package:flutter/material.dart';
import '../services/product_service.dart';
import 'item_view.dart';

class ClothingListView extends StatefulWidget {
  final int genderId;
  final int brandId;
  final int categoryId;
  final bool isGenderId;
  final bool isBrandId;
  final bool isCategoryId;
  const ClothingListView(
      {super.key,
      required this.brandId,
      required this.isBrandId,
      required this.categoryId,
      required this.isCategoryId,
      required this.genderId,
      required this.isGenderId});

  @override
  State<ClothingListView> createState() => _ClothingListViewState();
}

class _ClothingListViewState extends State<ClothingListView> {
  final productService = ProductService();
  @override
  Widget build(BuildContext context) {
    final productFuture = productService.getAllProducts();
    late List<dynamic>? data;

    return FutureBuilder(
      future: productFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final products = snapshot.data;
          if (widget.isGenderId) {
            data = products
                ?.where((element) => element.genderId == widget.genderId)
                .toList();
          }
          if (widget.isBrandId) {
            data = products
                ?.where((element) => element.brandId == widget.brandId)
                .toList();
          }
          if (widget.isCategoryId) {
            data = products
                ?.where((element) => element.categoryId == widget.categoryId)
                .toList();
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ItemView(product: data?[index]),
                            ),
                          );
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image.network(
                                    data?[index].image,
                                    width: 70,
                                    height: 120,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  data?[index].name,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'S/. ${data?[index].price}',
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
