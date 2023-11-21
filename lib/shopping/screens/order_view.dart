import 'package:flutter/material.dart';
import '../../globals.dart' as globals;
import '../../database/database.dart';

// ignore: must_be_immutable
class OrderView extends StatefulWidget {
  List<CartData>? list;
  double totalProducts;
  OrderView({super.key, required this.totalProducts, required this.list});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  late AppDatabase database;
  static const values = <String>['Priority', 'Standard', 'Economic'];
  static const mapPrices = {
    'Priority': 50.00,
    'Standard': 30.00,
    'Economic': 0.00,
  };
  String selectedValue = values.first;
  double? valueShipping;
  double getCartTotal() {
    double total = 0.0;
    for (int i = 0; i < widget.list!.length; i++) {
      total += widget.list![i].quantity * widget.list![i].price;
    }
    return total;
  }

  double? updateShipping() {
    valueShipping = mapPrices[selectedValue];

    return valueShipping;
  }

  double getTotal(){
    return updateShipping()! + getCartTotal() + 30;
  }

  @override
  void initState() {
    super.initState();
    database = AppDatabase();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).dividerColor;
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'home');
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: colors,
                ))),
                margin: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Address'),
                    IconButton(
                      onPressed: _showAlertDialog,
                      icon: Icon(
                        Icons.edit,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: colors,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Office address'),
                        Text(
                          '123 Elm Street, Springfield 62701',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: colors,
                ))),
                margin: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Shipping type'),
                  ],
                ),
              ),
              buildRadios(),
              /*Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: colors,
                ))),
                margin: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Payment Method'),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: colors,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        RadioListTile(
                          value: 1,
                          groupValue: 2,
                          title: Text(
                            'Credit Card **** 2202',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Juan Gonzalez',
                          ),
                          onChanged: null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),*/
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: colors,
                    ),
                  ),
                ),
                margin: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Order Summary'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Products'),
                        Text('S/.${getCartTotal().toStringAsFixed(2)}'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Shipping'),
                        Text('S/. ${updateShipping()}'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Service'),
                        Text('S/.30.00'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total'),
                      Text('S/. ${getTotal().toStringAsFixed(2)}'),
                    ],
                  ),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                        onPressed: () {
                          database.deleteAllByUserId(globals.id);
                          Navigator.pushReplacementNamed(context, 'confirmed');
                        },
                        child: Text(
                          'Pay',
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRadios() => Column(
        children: values.map(
          (value) {
            return SizedBox(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).dividerColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                elevation: 2,
                child: RadioListTile<String>(
                  value: value,
                  groupValue: selectedValue,
                  title: Text(
                    value,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium?.color),
                  ),
                  secondary: Text('+ S/. ${mapPrices[value]!}'),
                  onChanged: (value) => setState(() => selectedValue = value!,),
                ),
              ),
            );
          },
        ).toList(),
      );

  Future<void> _showAlertDialog() async {
    return showGeneralDialog<void>(
      context: context,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
      transitionBuilder: (context, a1, a2, widget) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
          child: AlertDialog(
            title: Text(
              'Edit address',
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium?.color),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextField(
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium?.color),
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      hintText: 'Enter your Address',
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
                  overlayColor:
                      MaterialStatePropertyAll<Color>(Colors.transparent),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.lightGreen),
                  overlayColor:
                      MaterialStatePropertyAll<Color>(Colors.transparent),
                ),
                child: Text(
                  'Accept',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
