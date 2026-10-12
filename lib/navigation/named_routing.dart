import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//////////////////////////////////////////////////////////////
// 🔥 MODEL
//////////////////////////////////////////////////////////////

class Product {
  final String name;
  final int price;

  Product(this.name, this.price);
}

//////////////////////////////////////////////////////////////
// 🔥 APP
//////////////////////////////////////////////////////////////

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',

      routes: {
        '/': (context) => const HomeScreen(),
        '/detail': (context) => const DetailScreen(),
      },
    );
  }
}

//////////////////////////////////////////////////////////////
// 🔥 HOME SCREEN (SEND DATA)
//////////////////////////////////////////////////////////////

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final product = Product("iPhone", 80000);

    return Scaffold(
      appBar: AppBar(title: const Text("Home")),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 🔥 PASS DATA
            Navigator.pushNamed(
              context,
              '/detail',
              arguments: product,
            );
          },
          child: const Text("Open Product Detail"),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
// 🔥 DETAIL SCREEN (RECEIVE DATA)
//////////////////////////////////////////////////////////////

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // 🔥 RECEIVE DATA
    final product =
    ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(title: const Text("Detail")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Product: ${product.name}"),
            Text("Price: ₹${product.price}"),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}


/*

Send → arguments
Receive → ModalRoute

🔥 ❌ LIMITATIONS
❌ Hard for dynamic data passing
❌ Not good for deep linking
❌ Not scalable for very large apps
*/
