import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../../database/database.dart';
import '../../database/favorite_model.dart';
import '../../fitting_room/screens/pose_detector_view.dart';
import '../../globals.dart' as globals;
import '../../search/model/product.dart';
import '../../search/services/product_service.dart';

class WishItemView extends StatefulWidget {
  final int productId;
  const WishItemView({super.key, required this.productId});

  @override
  State<WishItemView> createState() => _WishItemViewState();
}

class _WishItemViewState extends State<WishItemView> {
  final productService = ProductService();
  late AppDatabase database;
  bool isFavorite = false;
  bool isInTheCart = false;

  void onSizeChange(String size) {}

  void _favorite(Product product) {
    if (isFavorite) {
      database.deleteItem(product.id!);
    } else {
      database.insertItem(FavoriteModel(
          rating: product.rating,
          price: product.price,
          name: product.name,
          image: product.image,
          productId: product.id!,
          userId: globals.id));
    }

    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void _isInTheCart() {
    setState(() {
      isInTheCart = !isInTheCart;
    });
  }

  @override
  void initState() {
    database = context.read<AppDatabase>();
    database.existsProduct(widget.productId, globals.id).then((value) {
      setState(() {
        isFavorite = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productFuture = productService.getProductById(widget.productId);

    return FutureBuilder(
      future: productFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final p = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Product Detail'),
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'home');
                  },
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      _favorite(p!);
                    },
                    icon: isFavorite
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                            shadows: const [Shadow(blurRadius: 2)],
                          )
                        : Icon(
                            Icons.favorite_border,
                          ),
                  ),
                  IconButton(
                    onPressed: () {
                      _isInTheCart();
                    },
                    icon: isInTheCart
                        ? Icon(
                            Icons.shopping_cart,
                            shadows: const [Shadow(blurRadius: 2)],
                          )
                        : Icon(
                            Icons.shopping_cart_outlined,
                          ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                p!.image,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      p.name,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    'S/. ${p.price}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: p.rating,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  itemCount: 5,
                                  itemSize:
                                      MediaQuery.sizeOf(context).height / 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text('(${p.rating})'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          p.description!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Select size',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        OverflowBar(
                          alignment: MainAxisAlignment.center,
                          children: ['XS', 'S', 'M', 'L', 'XL']
                              .map(
                                (size) => _SizeButton(
                                  onPressed: () => onSizeChange(size),
                                  child: Text(size),
                                ),
                              )
                              .toList(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PoseDetectorView(),
                              ),
                            );
                          },
                          child: const Text('Try on',
                              style: TextStyle(fontSize: 14)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, 'home');
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                title: Text('Fitster'),
                centerTitle: true,
              ),
              body: Center(
                child: Text('Your wish list is empty.'),
              ),
            );
          }
        } else {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, 'home');
                },
                icon: Icon(Icons.arrow_back),
              ),
              title: Text('Fitster'),
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

class _SizeButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;

  const _SizeButton({
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 14),
          child: child,
        ),
      ),
    );
  }
}
