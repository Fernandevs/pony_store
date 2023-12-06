import 'package:flutter/material.dart';

class NoContent extends StatelessWidget {
  const NoContent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: const Center(
        child: Column(
          children: <Widget>[
            Icon(
              Icons.info_outline,
              size: 400,
            ),
            Text(
              'No hay productos agregados',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
