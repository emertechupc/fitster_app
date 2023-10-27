import 'package:flutter/material.dart';

import 'item_shopping.dart';

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ItemShopping()
        ],
      ),
    );
  }
}