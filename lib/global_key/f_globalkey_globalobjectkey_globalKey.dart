import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GlobalObjectKeyDemo(),
    );
  }
}

class GlobalObjectKeyDemo extends StatefulWidget {
  const GlobalObjectKeyDemo({super.key});

  @override
  State<GlobalObjectKeyDemo> createState() => _GlobalObjectKeyDemoState();
}

class _GlobalObjectKeyDemoState extends State<GlobalObjectKeyDemo> {

  // 🔷 SAME OBJECT instances
  final Product apple = Product("Apple");
  final Product banana = Product("Banana");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GlobalObjectKey Demo")),

      body: Column(
        children: [

          const Text("Product List"),

          // 🔷 LIST SECTION
          ProductTile(
            key: GlobalObjectKey(apple), // 🔥 SAME object key
            product: apple,
          ),

          ProductTile(
            key: GlobalObjectKey(banana),
            product: banana,
          ),

          const Divider(),

          const Text("Cart Section"),

          // 🔷 CART SECTION (same objects reused)
          ProductTile(
            key: GlobalObjectKey(apple), // 🔥 SAME object again
            product: apple,
          ),

          ProductTile(
            key: GlobalObjectKey(banana),
            product: banana,
          ),
        ],
      ),
    );
  }
}

// 🔷 MODEL
class Product {
  final String name;

  Product(this.name);
}

// 🔷 STATEFUL WIDGET
class ProductTile extends StatefulWidget {
  final Product product;

  const ProductTile({super.key, required this.product});

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.product.name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Count: $count"),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                count++;
              });
            },
          ),
        ],
      ),
    );
  }
}



/*
GlobalObjectKey is a type of GlobalKey that uses an object’s identity
to uniquely identify a widget across the entire app

🔥 🎯 WHEN to use
✔ When you have a data object (model)
✔ You want GLOBAL uniqueness (not just inside list)
✔ Same object used across different parts of UI

🔥 ❌ WHEN NOT to use
❌ When objects are recreated (API refresh)
❌ For simple lists (use ValueKey)
❌ When object reference changes


🔥 🧠 What happens here?

👉 Same object used:

Product apple = Product("Apple");

👉 Used in TWO places:

Product List
Cart Section

👉 Because of:

GlobalObjectKey(apple)

Flutter knows:

"This is SAME Apple widget"
🔥 RESULT
Tap "+" in Product List → Cart also reflects SAME state ✅

👉 State is shared across UI

*/
