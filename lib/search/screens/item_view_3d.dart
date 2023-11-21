import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ItemView3d extends StatefulWidget {
  final String src3dModel;
  final String productName;
  final String price;
  final double rating;
  final String productBrandModel;
  const ItemView3d({
    Key? key,
    required this.src3dModel,
    required this.productName,
    required this.price,
    required this.productBrandModel,
    required this.rating,
  }) : super(key: key);

  @override
  State<ItemView3d> createState() => _ItemView3dState();
}

class _ItemView3dState extends State<ItemView3d> {
  void onSizeChange(String size) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                
              )),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //test
              //const Image(image: AssetImage('assets/men1.jpg')),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.41,
                child: Stack(alignment: Alignment.topRight, children: [
                  ModelViewer(
                      src: widget.src3dModel,
                      ar: true,
                      arPlacement: ArPlacement.floor,
                      autoRotate: true,
                      cameraControls: true,
                      arScale: ArScale.auto)
                ]),
              ),
              //end-test
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.productName,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          widget.price,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: widget.rating,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        itemCount: 5,
                        itemSize: MediaQuery.sizeOf(context).height / 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('(${widget.rating})'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.productBrandModel,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              const Text(
                'Made from our soft, midweight cotton in a relaxed fit, this tee keeps it casual and comfy all day. Bold graphics celebrate our diverse global community and the connections we make through sport.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 10,
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
              /*ElevatedButton(
                 onPressed: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       */ /* builder: (context) => const PoseDetectorView(), */ /*
                       builder:(context) => const ArCameraView(),
                     ),
                   );
                 },
                 child: const Text('Try on', style: TextStyle(fontSize: 14)),
               ),*/
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
