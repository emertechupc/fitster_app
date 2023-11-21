import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../database/database.dart';
import '../../search/model/product.dart';
import '../../globals.dart' as globals;
import 'wish_list_item_view.dart';

class WishListView extends StatefulWidget {
  const WishListView({super.key});

  @override
  State<WishListView> createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  bool isEmpty = false;
  late AppDatabase database;
  @override
  void initState() {
    super.initState();
    database = AppDatabase();
  }

  @override
  Widget build(BuildContext context) {
    final pFuture = database.getFavoriteProducts(globals.id);
    return Scaffold(
      appBar: AppBar(
        title: Text('Wish List'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'home');
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10,),
            FutureBuilder<List<Favorite>>(
              future: pFuture,
              builder: (context, snapshot) {
                final List<Favorite>? list = snapshot.data;

                if (snapshot.connectionState != ConnectionState.done) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (list != null) {
                  isEmpty = false;
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 5.0,
                      right: 5.0,
                      bottom: 5.0,
                    ),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        final data = list[index];
                        return ItemCard(
                            product: Product(
                                id: data.productId,
                                name: data.name,
                                rating: data.rating,
                                price: data.price,
                                image: data.image));
                      },
                    ),
                  );
                }
                return Center(
                  child: Text('Your Wish List is empty.'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ItemCard extends StatelessWidget {
  Product product;
  ItemCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => WishItemView(productId: product.id!),
                ));
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 170,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  height: 150,
                  width: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(product.image),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(product.name),
                    Text('S/. ${product.price}'),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: product.rating,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          itemCount: 5,
                          itemSize: MediaQuery.sizeOf(context).height / 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('(${product.rating})')
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
