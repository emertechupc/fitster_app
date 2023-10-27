import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../service/item_service.dart';
import 'ad_slidshow.dart';
import 'brands_horizontal_listview.dart';
import 'item_horizontal_listview.dart';

class WelcomeView extends StatelessWidget {
  static const List<String> ads = [
    'assets/ads/anuncio1.jpg',
    'assets/ads/anuncio2.jpg',
    'assets/ads/anuncio3.jpg',
  ];

  static const List<String> brands = [
    'assets/brands/adidas.svg',
    'assets/brands/gucci.svg',
    'assets/brands/nike.svg',
    'assets/brands/puma.svg',
    'assets/brands/ralphlauren.svg',
    'assets/brands/tommy-hilfiger.svg',
  ];

  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final itemService = Provider.of<ItemService>(context);
    final itemFuture = itemService.getProduct();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              ),
              BrandsHorizontalListview(brands: brands, title: 'Associated brands',),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
