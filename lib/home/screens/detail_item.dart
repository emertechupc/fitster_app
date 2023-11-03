import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../fitting_room/screens/pose_detector_view.dart';
import '../model/item.dart';

class DetailItemView extends StatelessWidget {
  final Item item;
  void onSizeChange(String size) {}
  const DetailItemView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      item.image,
                    ),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(child: Text(item.title)),
                  Text(' S/. ${item.price}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
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
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '(${item.rating.rate})',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                item.description,
                style: TextStyle(fontWeight: FontWeight.normal),
                textAlign: TextAlign.justify,
              ),
            ),
            const Text(
              'Select size',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            OverflowBar(
              alignment: MainAxisAlignment.center,
              children: ['XS', 'S', 'M', 'L', 'XL']
                  .map(
                    (size) => _SizeButton(
                      onPressed: () => onSizeChange(size),
                      child: Text(size),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PoseDetectorView(),
                  ),
                );
              },
              child: const Text('Try on', style: TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}

class _SizeButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;

  const _SizeButton({
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 14),
          child: child,
        ),
      ),
    );
  }
}
