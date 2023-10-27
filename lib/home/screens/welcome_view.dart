import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/item_service.dart';
import 'ad_slidshow.dart';
import 'item_horizontal_listview.dart';

class WelcomeView extends StatelessWidget {
  static const List<String> ads = [
    'assets/ads/anuncio1.jpg',
    'assets/ads/anuncio2.jpg',
    'assets/ads/anuncio3.jpg',
  ];

  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final itemService = Provider.of<ItemService>(context);
    final itemFuture = itemService.getProduct();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          AdSlideshow(
            ads: ads,
          ),
          SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: itemFuture,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ItemHorizontalListview(
                  items: snapshot.data,
                  title: 'Most popular products',
                );
              } else {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
