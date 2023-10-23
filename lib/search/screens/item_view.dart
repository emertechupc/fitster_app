import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../fitting_room/screens/pose_detector_view.dart';

class ItemView extends StatefulWidget {
  const ItemView({super.key});

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  void onSizeChange(String size) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitster'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Image(image: AssetImage('assets/men1.jpg')),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Men's t-shirt",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          '\$29.90',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 20.0,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    onRatingUpdate: (rating) {
                      if (kDebugMode) {
                        print(rating);
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 10,),
              const Text(
                'Nike Sportswear',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 10,),
              const Text(
                'Made from our soft, midweight cotton in a relaxed fit, this tee keeps it casual and comfy all day. Bold graphics celebrate our diverse global community and the connections we make through sport.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 10,),
              const Text(
                'Select size',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 10,),
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
              SizedBox(height: 10,),
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
