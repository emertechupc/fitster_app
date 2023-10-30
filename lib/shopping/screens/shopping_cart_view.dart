import 'package:flutter/material.dart';
import 'item_shopping.dart';

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ItemShopping(),
              ItemShopping(),
              ItemShopping(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const [
                      Text('Total'),
                      Text('S/.250.00'),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'order');
                      },
                      child: Text(
                        'Go to pay',
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
