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
// 🔥 ROUTE GENERATOR (CENTRALIZED)
//////////////////////////////////////////////////////////////

class AppRoutes {
  static const home = '/';
  static const detail = '/detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {

    // 🔷 HOME
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

    // 🔷 DETAIL WITH DATA
      case detail:
        final product = settings.arguments as Product;

        return MaterialPageRoute(
          builder: (_) => DetailScreen(product: product),
        );

    // 🔴 UNKNOWN ROUTE
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Page not found")),
          ),
        );
    }
  }
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

      initialRoute: AppRoutes.home,

      // 🔥 USE onGenerateRoute
      onGenerateRoute: AppRoutes.generateRoute,
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

            // 🔥 SEND DATA
            Navigator.pushNamed(
              context,
              AppRoutes.detail,
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
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
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
onGenerateRoute is a callback in Flutter used to dynamically handle
route navigation and pass data safely between screens.

🔥 🎯 WHY use onGenerateRoute?
✔ Type-safe navigation
✔ Easy data passing
✔ Centralized control
✔ Scalable for large apps
✔ Used in production apps

🔥 ⚠️ IMPORTANT
Always cast arguments carefully
or app will crash ❌

🔥 🧠 MEMORY TRICK
routes {} → simple apps
onGenerateRoute → real apps
*/
