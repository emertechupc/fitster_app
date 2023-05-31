import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemView extends StatefulWidget {
  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
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
            children: <Widget>[
              Image(image: AssetImage("assets/men1.jpg")),
              Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "Men's t-shirt        ", style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    )),
                    TextSpan(text: "\$29.90", style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20.0
                    )),
                  ],
                ),
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              Text("Nike Sportswear",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.normal
                ),
              ),
              Text(
                "Made from our soft, midweight cotton in a relaxed fit, this tee keeps it casual and comfy all day. Bold graphics celebrate our diverse global community and the connections we make through sport.",
                style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w300
                ),
              ),
              Text("Select size",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.normal
                ),
              ),
              ButtonBar(
                children: [
                  ElevatedButton(
                      child: Text(
                          "XS",
                          style: TextStyle(fontSize: 14)
                      ),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                              )
                          )
                      ),
                      onPressed: () => null
                  ),
                  ElevatedButton(
                      child: Text(
                          "S",
                          style: TextStyle(fontSize: 14)
                      ),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )
                          )
                      ),
                      onPressed: () => null
                  ),
                  ElevatedButton(
                      child: Text(
                          "M",
                          style: TextStyle(fontSize: 14)
                      ),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )
                          )
                      ),
                      onPressed: () => null
                  ),
                  ElevatedButton(
                      child: Text(
                          "L",
                          style: TextStyle(fontSize: 14)
                      ),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )
                          )
                      ),
                      onPressed: () => null
                  ),
                  ElevatedButton(
                      child: Text(
                          "XL",
                          style: TextStyle(fontSize: 14)
                      ),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )
                          )
                      ),
                      onPressed: () => null
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                    'Try on',
                    style: TextStyle(fontSize: 14)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
