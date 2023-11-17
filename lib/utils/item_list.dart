import 'package:flutter/material.dart';

import '../search/screens/clothing_list_view.dart';

class _Item extends StatelessWidget {
  final String child;

  const _Item({required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClothingListView(
              clothingItemsType: child,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(16.0),
        height: 90,
        width: 90,
        decoration: const BoxDecoration(
          color: Color(0xFFF2F2F2),
          borderRadius: BorderRadiusDirectional.all(
            Radius.circular(4),
          ),
        ),
        child: Center(
          child: Text(
            child,
            style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xFF4B64F2),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemList extends StatefulWidget {
  final List<String> items;
  const ItemList({super.key, required this.items});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / 2,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,      
        shrinkWrap: true,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return _Item(
              child: widget.items[index],
          );
        },
        padding: const EdgeInsets.all(8),
      ),
    );
  }
}
