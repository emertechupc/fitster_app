import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../search/screens/clothing_list_view.dart';

class _Item extends StatelessWidget {
  final String? child;
  final String? image;
  final int genderId;
  final int brandId;
  final int categoryId;
  final bool isGenderId;
  final bool isBrandId;
  final bool isCategoryId;

  const _Item({
    required this.child,
    required this.isGenderId,
    required this.genderId,
    required this.isBrandId,
    required this.brandId,
    required this.isCategoryId,
    required this.categoryId,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClothingListView(
              isBrandId: isBrandId,
              brandId: brandId,
              categoryId: categoryId,
              genderId: genderId,
              isCategoryId: isCategoryId,
              isGenderId: isGenderId,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isBrandId)
              Center(
                child: SvgPicture.asset(
                  image!,
                  fit: BoxFit.contain,
                  height: 100,
                ),
              ),
            if (isGenderId || isCategoryId)
              Center(
                child: Image.asset(
                  image!,
                  fit: BoxFit.contain,
                  height: 100,
                ),
              ),
            if (isGenderId || isCategoryId)
              Center(
                child: Text(
                  child!,
                  style: TextStyle(
                    color: Color(0xFF4B64F2),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class ItemMap extends StatefulWidget {
  final Map<int, String> items;
  final Map<int, String> itemsImages;
  final bool isGenderId;
  final bool isBrandId;
  final bool isCategoryId;
  const ItemMap({
    super.key,
    required this.items,
    required this.isBrandId,
    required this.isCategoryId,
    required this.isGenderId,
    required this.itemsImages,
  });

  @override
  State<ItemMap> createState() => _ItemMapState();
}

class _ItemMapState extends State<ItemMap> {
  @override
  Widget build(BuildContext context) {
    print(widget.isGenderId);
    return SizedBox(
      height: MediaQuery.of(context).size.width / 2,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          int key = widget.items.keys.elementAt(index);
          int key2 = widget.itemsImages.keys.elementAt(index);
          return _Item(
            child: widget.items[key],
            image: widget.itemsImages[key2],
            isGenderId: widget.isGenderId,
            isBrandId: widget.isBrandId,
            isCategoryId: widget.isCategoryId,
            genderId: (index + 1),
            categoryId: (index + 1),
            brandId: (index + 1),
          );
        },
        padding: const EdgeInsets.all(8),
      ),
    );
  }
}
