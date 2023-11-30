import 'package:flutter/material.dart';

class ShoppingCartFAB extends StatelessWidget {
  const ShoppingCartFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 8,
          right: 8,
          child: FloatingActionButton(
            child: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ),
        const Positioned(
          bottom: 40,
          right: 16,
          child: Text('0'),
        ),
      ],
    );
  }
}
