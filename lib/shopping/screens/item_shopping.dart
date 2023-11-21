import 'package:flutter/material.dart';

import '../../database/database.dart';

// ignore: must_be_immutable
class ItemShopping extends StatefulWidget {
  final int productId;
  final String name;
  final String size;
  final double price;
  final String image;
  int quantity;
  ItemShopping({
    super.key,
    required this.name,
    required this.size,
    required this.price,
    required this.image,
    required this.quantity,
    required this.productId,
  });

  @override
  State<ItemShopping> createState() => _ItemShoppingState();
}

class _ItemShoppingState extends State<ItemShopping> {
  late AppDatabase database;
  void incrementQuantity() {
    setState(() {
      widget.quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      widget.quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colors.dividerColor,
          ),
        ),
      ),
      height: 180,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.0),
            height: 150,
            width: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    maxLines: 2,
                  ),
                  Text('Size ${widget.size}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('S/. ${widget.price}'),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              decrementQuantity();
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text('${widget.quantity}'),
                          IconButton(
                            onPressed: () {
                              incrementQuantity();
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
