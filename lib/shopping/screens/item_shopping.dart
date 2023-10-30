import 'package:flutter/material.dart';

class ItemShopping extends StatelessWidget {
  const ItemShopping({super.key});

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
            color: Colors.amber,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'T-shirt',
                    maxLines: 2,
                  ),
                  Text(
                    'White Casual Wear Blazer for women',
                    maxLines: 2,
                  ),
                  Text('Size M'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('S/. 250'),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.remove),
                          ),
                          Text('1'),
                          IconButton(
                            onPressed: () {},
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
