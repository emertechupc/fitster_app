import 'package:flutter/material.dart';

import '../utils/item_list.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  static const List<String> genders = [
    'Male',
    'Unisex',
    'Female',
  ];

  static const List<String> brands = [
    'Gucci',
    'Nike',
    'Adidas',
    'Puma',
    'Ralph Lauren',
    'Tommy Hilfiger',
  ];

  static const List<String> styles = [
    'Sports',
    'Elegant',
    'Casual',
    'Oversize',
    'Fashion',
    'Vintage',
  ];

  static const List<String> types = [
    'T-shirts',
    'Shirts',
    'Suits',
    'Jeans',
    'Joggers',
    'Shorts',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fitster',
        ),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const Padding(
          //   padding: EdgeInsets.all(16.0),
          //   child: SearchBar(
          //     leading: Icon(
          //       Icons.search,
          //     ),
          //     hintText: 'Search...',
          //   ),
          // ),
          ItemList(items: genders),
          _SectionTitle(child: Text('Brands')),
          ItemList(items: brands),
          _SectionTitle(child: Text('Styles')),
          ItemList(items: styles),
          _SectionTitle(child: Text('Types')),
          ItemList(items: types),
        ],
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
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF4B64F2),
        ),
        child: child,
      ),
    );
  }
}
