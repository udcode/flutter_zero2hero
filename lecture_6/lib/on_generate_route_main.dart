import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      // הגדרת onGenerateRoute כדי לטפל בנתיבים דינמיים
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => HomeScreen());
        } else if (settings.name!.startsWith('/product/')) {
          final id = settings.name!.substring('/product/'.length);
          return MaterialPageRoute(
            builder: (context) => ProductScreen(productId: id),
          );
        }
        // אם הנתיב לא נמצא - מעבר למסך 404
        return MaterialPageRoute(builder: (context) => NotFoundScreen());
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                // מעבר לנתיב דינמי עם מזהה מוצר
                Navigator.pushNamed(context, '/product/123');
              },
              child: Text("Go to Product 123"),
            ),
          ),
          //go to unknown route
          Center(
            child: ElevatedButton(
              onPressed: () {
                // מעבר לנתיב לא ידוע
                Navigator.pushNamed(context, '/unknown');
              },
              child: Text("Go to Unknown Route"),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductScreen extends StatelessWidget {
  final String productId;

  ProductScreen({required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: Center(
        child: Text("Product ID: $productId"),
      ),
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("404 - Not Found")),
      body: Center(
        child: Text("Page not found!"),
      ),
    );
  }
}
