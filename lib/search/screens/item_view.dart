import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../../database/cart_item_model.dart';
import '../../database/database.dart';
import '../../database/favorite_model.dart';
import '../../fitting_room/screens/pose_detector_view.dart';
import '../model/product.dart';
import '../../globals.dart' as globals;

class ItemView extends StatefulWidget {
  final Product product;
  const ItemView({super.key, required this.product});

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  late AppDatabase database;
  bool isFavorite = false;
  bool isInTheCart = false;

  void onSizeChange(String size) {}

  void _addCart() {
    database.insertCartItem(
      CartItem(
        image: widget.product.image,
        productId: widget.product.id!,
        name: widget.product.name,
        price: widget.product.price,
        size: 'M',
        quantity: 1,
        userId: globals.id,
      ),
    );
  }

  void _favorite() {
    if (isFavorite) {
      database.deleteItem(widget.product.id!);
    } else {
      database.insertItem(FavoriteModel(
          rating: widget.product.rating,
          price: widget.product.price,
          name: widget.product.name,
          image: widget.product.image,
          productId: widget.product.id!,
          userId: globals.id));
    }

    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  void initState() {
    database = context.read<AppDatabase>();
    database.existsProduct(widget.product.id!, globals.id).then((value) {
      setState(() {
        isFavorite = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _favorite,
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
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.product.image,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
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
                            widget.product.name,
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
                          'S/. ${widget.product.price}',
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
                        rating: widget.product.rating,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        itemCount: 5,
                        itemSize: MediaQuery.sizeOf(context).height / 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('(${widget.product.rating})'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Nike Sportswear',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                widget.product.description!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                ),
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
              child: const Text('Try on', style: TextStyle(fontSize: 14)),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: _addCart,
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
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
