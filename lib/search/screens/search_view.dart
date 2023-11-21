import 'package:flutter/material.dart';

import '../../utils/item_list.dart';

const Map<int, String> genders = {1: 'Men', 2: 'Women', 3: 'Children'};

const Map<int, String> gendersImages = {1: 'assets/men.jpg', 2: 'assets/women.jpg', 3: 'assets/children.jpeg'};

const Map<int, String> brands = {
  1: 'Adidas',
  2: 'Nike',
  3: 'Levi\'s',
  4: 'Calvin Klein',
  5: 'Gucci',
  6: 'Ralph Lauren',
  7: 'Puma',
  8: 'Tommy Hilfiger',
  9: 'Under Armour',
  10: 'Gap',
};

const Map<int, String> brandsImages = {
  1: 'assets/brands/adidas.svg',
  2: 'assets/brands/nike.svg',
  3: 'assets/brands/levis.svg',
  4: 'assets/brands/calvinklein.svg',
  5: 'assets/brands/gucci.svg',
  6: 'assets/brands/ralphlauren.svg',
  7: 'assets/brands/puma.svg',
  8: 'assets/brands/tommy-hilfiger.svg',
  9: 'assets/brands/underarmour.svg',
  10: 'assets/brands/gap.svg',
};

const Map<int, String> categories = {
  1: 'T-shirt',
  2: 'Pants',
  3: 'Dress',
  4: 'Jeans',
  5: 'Shirt',
  6: 'Blouse',
  7: 'Sweater',
  8: 'Jacket',
  9: 'Hoodie',
  10: 'Short',
};

const Map<int, String> categoriesImages = {
  1: 'assets/tshirt.png',
  2: 'assets/pants.png',
  3: 'assets/dress.png',
  4: 'assets/jeans.png',
  5: 'assets/shirt.png',
  6: 'assets/blouse.png',
  7: 'assets/sweater.png',
  8: 'assets/jacket.png',
  9: 'assets/hoodie.png',
  10: 'assets/short.png',
};

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: const [
              SizedBox(
                height: 10,
              ),
              _SectionTitle(child: Text('Gender')),
              ItemMap(
                items: genders,
                isGenderId: true,
                isBrandId: false,
                isCategoryId: false,
                itemsImages: gendersImages,
              ),
              _SectionTitle(child: Text('Brands')),
              ItemMap(
                items: brands,
                isBrandId: true,
                isCategoryId: false,
                isGenderId: false,
                itemsImages: brandsImages,
              ),
              _SectionTitle(child: Text('Categories')),
              ItemMap(
                items: categories,
                isCategoryId: true,
                isBrandId: false,
                isGenderId: false,
                itemsImages: categoriesImages,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final Widget child;

  const _SectionTitle({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF4B64F2),
          ),
          child: child,
        ),
      ),
    );
  }
}
