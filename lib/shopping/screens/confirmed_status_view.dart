import 'package:flutter/material.dart';

class ConfirmedStatusView extends StatelessWidget {
  const ConfirmedStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: MediaQuery.of(context).size.height/5,
                color: Colors.green,
              ),
              SizedBox(height: 10,),
              Text('You order has been confirmed'),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'home');
                },
                child: Text(
                  'Continue',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
