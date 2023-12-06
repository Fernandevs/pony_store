import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class OrderQrScreen extends StatelessWidget {
  static const name = 'order-qr-screen';

  final String id;

  const OrderQrScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        centerTitle: true,
        title: const Text('Recoge tu pedido con QR'),
      ),
      body: QrImageView(
        data: id,
        version: QrVersions.auto,
        size: 400,
      ),
    );
  }
}
