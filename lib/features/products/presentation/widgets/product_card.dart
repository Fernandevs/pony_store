import 'package:flutter/material.dart';
import 'package:pony_store/features/products/domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Column(
        children: <Widget>[
          _ImageViewer(images: product.images),
          Text(product.name, textAlign: TextAlign.center),
          Text('\$${product.price}', textAlign: TextAlign.center),
          const SizedBox(height: 20),
          TextButton(onPressed: (){}, child: const Text('Agregar al carrito'))
        ],
      ),
    );
  }
}

class _ImageViewer extends StatelessWidget {
  final List<String> images;

  const _ImageViewer({required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets/images/no-image.jpg',
          fit: BoxFit.cover,
          height: 250,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: FadeInImage(
        height: 250,
        fit: BoxFit.cover,
        image: NetworkImage(images.first),
        fadeInDuration: const Duration(milliseconds: 200),
        fadeOutDuration: const Duration(milliseconds: 100),
        placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
      ),
    );
  }
}
