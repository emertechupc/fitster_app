import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(image: AssetImage('logo.png')),
        const SizedBox(height: 32),
        FilledButton(
          onPressed: () {},
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll<Color>(Color(0xFF4B64F2)),
              fixedSize: MaterialStatePropertyAll<Size>(Size(128, 48))),
          child: const Text(
            'Start',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
