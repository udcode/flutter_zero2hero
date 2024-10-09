import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';




@RoutePage()
class ProductPage extends StatelessWidget {
  static const String path = '/product/';
  final Product product;
  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("Product Page ${product.id}")),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the home page
                AutoRouter.of(context).maybePop();
              },
              child: const Text("Go back"),
            ),
          ),

        ],
      ),
    );
  }
}




@RoutePage()
class VeryNestedRoutePage extends StatelessWidget {
  static const String path = '/veryNestedRoute/';
  final int id;
  const VeryNestedRoutePage({super.key,@PathParam('nestedId') required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("Very Nested Route Page $id")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the home page
            AutoRouter.of(context).maybePop();
          },
          child: const Text("Go back"),
        ),
      ),
    );
  }
}
