import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrandsHorizontalListview extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final List<String> brands;

  const BrandsHorizontalListview(
      {super.key, this.title, this.subTitle, required this.brands});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Column(
        children: [
          if (title != null || subTitle != null)
            _Title(title: title, subTitle: subTitle),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: brands.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return _Slide(
                  brand: brands[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String brand;

  const _Slide({required this.brand});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colors.background
      ),
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: SvgPicture.asset(
              brand,
              fit: BoxFit.fill,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Row(
        children: [
          if (title != null) Text(title!),
          const Spacer(),
          if (subTitle != null) Text(subTitle!)
        ],
      ),
    );
  }
}
