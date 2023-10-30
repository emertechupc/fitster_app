import 'package:flutter/material.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  static const values = <String>['Priority', 'Standard', 'Economic'];
  static const mapPrices = {
    'Priority': '+ S/.50.00',
    'Standard': '+ S/.30.00',
    'Economic': '+ S/.0.00',
  };
  String selectedValue = values.first;

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
              ),
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
                  children: const [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Products'),
                        Text('S/.725.00'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Shipping'),
                        Text('S/.50.00'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                    children: const [
                      Text('Total'),
                      Text('S/.250.00'),
                    ],
                  ),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                        onPressed: () {
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
                  secondary: Text(mapPrices[value]!),
                  onChanged: (value) => setState(() => selectedValue = value!),
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
                    style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
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
