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
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'Brands',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4B64F2),
              ),
            ),
          ),
          ItemList(items: _brands),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'Styles',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4B64F2),
              ),
            ),
          ),
          ItemList(items: _styles),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'Types',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4B64F2),
              ),
            ),
          ),
          ItemList(items: _types),
        ],
      ),
    );
  }
}
