import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lecture_6/auto_route/guards.dart';
import 'package:lecture_6/auto_route/product.dart';
@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class Product{
  final int id;
  final String name;
  final double price;
  Product({required this.id, required this.name, required this.price});
}

class _HomePageState extends State<HomePage> {

  var products = [
    Product(id: 1, name: "Product 1", price: 100),
    Product(id: 2, name: "Product 2", price: 200),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Center(
        child: Column(
          children: [
            for (var product in products)
              ElevatedButton(
                onPressed: () {
                  if(product.id==2){
                    isAdmin = true;
                  }
                  // Navigate to the product page
                  AutoRouter.of(context).pushNamed('${ProductPage.path}${product.id}');
                },
                child: Text(product.name),
              ),



            //navigate to very nested route
            ElevatedButton(
              onPressed: () {
                // Navigate to the very nested route page
                  AutoRouter.of(context).pushNamed('/product/125/veryNestedRoute/130', includePrefixMatches: true,);
              },
              child: Text("Go to Very Nested Route 130"),
            ),


            //navigate to dashboard
            ElevatedButton(
              onPressed: () {
                // Navigate to the dashboard page
                AutoRouter.of(context).pushNamed('/dashboard');
              },
              child: Text("Go to Dashboard"),
            ),
          ],
        ),
      ),
    );

  }
}
