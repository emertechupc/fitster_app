import 'package:flutter/material.dart';

import '../../utils/item_list.dart';

const Map<int, String> genders = {1: 'Men', 2: 'Women', 3: 'Children'};

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
              ItemMap(items: genders, isGenderId: true, isBrandId: false, isCategoryId: false,),
              _SectionTitle(child: Text('Brands')),
              ItemMap(items: brands, isBrandId: true, isCategoryId: false, isGenderId: false,),
              _SectionTitle(child: Text('Categories')),
              ItemMap(items: categories, isCategoryId: true, isBrandId: false, isGenderId: false,),
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
