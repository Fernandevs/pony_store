import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pony_store/features/orders/presentation/providers/order_provider.dart';
import 'package:pony_store/features/shared/widgets/no_content.dart';
import 'package:pony_store/features/shared/widgets/side_menu.dart';

class OrdersScreen extends ConsumerWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final orders = ref.watch(ordersProvider);

    return Scaffold(
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      appBar: AppBar(
        elevation: 8,
        centerTitle: true,
        title: const Text('Órdenes'),
      ),
      body: orders.orders.isNotEmpty ? const _OrderItems() : const NoContent(),
    );
  }
}

class _OrderItems extends ConsumerWidget {
  const _OrderItems();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(ordersProvider);

    return ListView.builder(
      itemCount: orders.orders.length,
      itemBuilder: (context, index) {
        final order = orders.orders[index];

        return ListTile(
          title: Text(order.createdAt.toString()),
          subtitle: Text('\$${order.total}'),
        );
      },
    );
  }
}
