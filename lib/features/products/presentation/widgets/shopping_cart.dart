import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pony_store/features/products/presentation/screens/order_screen.dart';

class ShoppingCart extends StatelessWidget {
  final int quantity;

  const ShoppingCart({super.key, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(OrderScreen.name),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 8,
            right: 8,
            child: FloatingActionButton(
              child: const Icon(Icons.shopping_cart),
              onPressed: () => context.pushNamed(OrderScreen.name),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 16,
            child: Text(quantity.toString()),
          ),
        ],
      ),
    );
  }
}
