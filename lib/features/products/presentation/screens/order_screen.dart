import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:pony_store/features/products/presentation/presentation.dart';
import 'package:pony_store/features/shared/widgets/no_content.dart';

class OrderScreen extends ConsumerWidget {
  static const name = 'order-screen';

  const OrderScreen({super.key});

  void showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Orden comprada')),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(shoppingCartProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        centerTitle: true,
        title: const Text('Comprar carrito'),
      ),
      body: products.products.isNotEmpty
          ? const _OrderItems()
          : const NoContent(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.read(shoppingCartProvider.notifier).checkout();
          showSnackbar(context);
          context.pop();
        },
        label: const Row(
          children: <Widget>[
            Icon(Icons.check),
            SizedBox(width: 8),
            Text('Ordenar'),
          ],
        ),
      ),
    );
  }
}

class _OrderItems extends ConsumerWidget {
  const _OrderItems();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(shoppingCartProvider);
    final remove = ref.watch(shoppingCartProvider.notifier).removeProduct;

    return ListView.builder(
      itemCount: products.products.length,
      itemBuilder: (context, index) {
        final product = products.products[index];

        return ListTile(
          title: Text(product.name),
          subtitle: Text('\$${product.price}'),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => remove(product),
          ),
        );
      },
    );
  }
}
