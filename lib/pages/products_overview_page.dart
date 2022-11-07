import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';

import '../data/dummy_data.dart';

class ProductsOverviewPage extends StatelessWidget {
  final List<Product> loadedProducts = dummyProducts;
  ProductsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha loja'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: loadedProducts.length,
          itemBuilder: (ctx, i) => Text(loadedProducts[i].title),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ),
      ),
    );
  }
}
