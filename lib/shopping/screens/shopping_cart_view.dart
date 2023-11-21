import 'package:flutter/material.dart';
import '../../database/database.dart';
import 'item_shopping.dart';
import '../../globals.dart' as globals;
import 'order_view.dart';

class ShoppingCartView extends StatefulWidget {
  const ShoppingCartView({super.key});

  @override
  State<ShoppingCartView> createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
  bool isEmpty = false;
  double total = 0.0;
  double resultado = 0.0;
  List<CartData>? aux = [];

  late AppDatabase database;

  @override
  void initState() {
    super.initState();
    database = AppDatabase();
  }

  @override
  Widget build(BuildContext context) {
    final pFuture = database.getCartItems(globals.id);
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              FutureBuilder<List<CartData>>(
                future: pFuture,
                builder: (context, snapshot) {
                  final List<CartData>? list = snapshot.data;
                  aux = list;

                  if (snapshot.connectionState != ConnectionState.done) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (list != null) {
                    isEmpty = false;

                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (context, index) {

                        final data = list[index];
                        if (list.isEmpty) {
                          return Center(
                            child: Text('Your Shopping Cart is empty.'),
                          );
                        } else {
                          return Dismissible(
                            key: Key(list[index].name),
                            direction: DismissDirection.endToStart,
                            onDismissed: ((direction) {
                              setState(() {
                                database.deleteCartItem(
                                    list[index].productId, list[index].userId);
                                list.removeAt(index);
                              });
                            }),
                            background: Container(
                              color: Colors.red,
                              padding: EdgeInsets.only(right: 16.0),
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ),
                            ),
                            child: ItemShopping(
                              productId: data.productId,
                              name: data.name,
                              size: data.size,
                              price: data.price,
                              image: data.image,
                              quantity: data.quantity,
                            ),
                          );
                        }
                      },
                    );
                  } else {
                    isEmpty = true;
                    return Center(
                      child: Text('Your Shopping Cart is empty.'),
                    );
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OrderView(totalProducts: resultado, list: aux,),
                          ),
                        );
                        //Navigator.pushReplacementNamed(context, 'order');
                      },
                      child: Text(
                        'Go to pay',
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
