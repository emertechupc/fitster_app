import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../model/item.dart';
import 'package:animate_do/animate_do.dart';

class ItemHorizontalListview extends StatelessWidget {
  final List<Item> items;
  final String? title;
  final String? subTitle;

  const ItemHorizontalListview({
    super.key,
    required this.items,
    this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (title != null || subTitle != null)
            _Title(title: title, subTitle: subTitle),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                if (items[index].category == 'men\'s clothing' ||
                    items[index].category == 'women\'s clothing') {
                  return _Slide(
                    item: items[index],
                  );
                } else {
                  return SizedBox(height: 0);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Item item;

  const _Slide({required this.item});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context);
    return Container(
      width: 180,
      color: colors.cardColor,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: SizedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  item.image,
                  fit: BoxFit.fill,
                  height: 170,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    }

                    return FadeIn(
                      child: child,
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5.0),
            width: 150,
            child: Text(
              item.title,
              maxLines: 2,
              style: TextStyle(
                fontSize: 11,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              'S/.${item.price}',
              style: TextStyle(
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RatingBarIndicator(
                rating: item.rating.rate,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.yellow.shade800,
                ),
                itemCount: 5,
                itemSize: MediaQuery.sizeOf(context).height / 40,
              ),
              Text(
                '(${item.rating.rate})',
                style: TextStyle(
                  fontSize: 12,
                ),
              )
            ],
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
