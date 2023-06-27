import 'package:flutter/material.dart';

import '../utils/item_list.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final List _genders = [
    'Male',
    'Unisex',
    'Female',
  ];

  final List _brands = [
    'Gucci',
    'Nike',
    'Adidas',
    'Puma',
    'Ralph Lauren',
    'Tommy Hilfiger',
  ];

  final List _styles = [
    'Sports',
    'Elegant',
    'Casual',
    'Oversize',
    'Fashion',
    'Vintage',
  ];

  final List _types = [
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
      body: Column(
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
          ItemList(items: _genders),
          _SectionTitle(child: Text('Brands')),
          ItemList(items: _brands),
          _SectionTitle(child: Text('Styles')),
          ItemList(items: _styles),
          _SectionTitle(child: Text('Types')),
          ItemList(items: _types),
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
