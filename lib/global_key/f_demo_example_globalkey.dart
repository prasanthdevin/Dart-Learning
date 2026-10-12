import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 🔷 MODEL
class Product {
  String name;
  int count;

  Product(this.name, this.count);
}

// 🔥 SHARED DATA (Same objects used everywhere)
List<Product> products = [
  Product("Apple", 0),
  Product("Banana", 0),
  Product("Mango", 0),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListScreen(),
    );
  }
}

//////////////////////////////////////////////////////////////////
// 🔥 PRODUCT LIST SCREEN
//////////////////////////////////////////////////////////////////

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CartScreen(),
                ),
              ).then((_) {
                setState(() {}); // 🔥 refresh when coming back
              });
            },
          ),
        ],
      ),

      body: ListView(
        children: products.map((product) {
          return ListTile(
            title: Text(product.name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Count: ${product.count}"),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      product.count++; // 🔥 SAME OBJECT UPDATED
                    });
                  },
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////
// 🔥 CART SCREEN
//////////////////////////////////////////////////////////////////

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // 🔥 Only show added items
    final cartItems = products.where((p) => p.count > 0).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),

      body: cartItems.isEmpty
          ? const Center(child: Text("Cart is empty"))
          : ListView(
        children: cartItems.map((product) {
          return ListTile(
            title: Text(product.name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Count: ${product.count}"),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      product.count++; // 🔥 SAME OBJECT
                    });
                  },
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}