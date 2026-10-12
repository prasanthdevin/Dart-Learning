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
      home: ProductGridScreen(),
    );
  }
}

class ProductGridScreen extends StatelessWidget {
  const ProductGridScreen({super.key});

  final List<Map<String, String>> products = const [
    {
      "name": "Nike Shoes",
      "price": "₹2999",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Adidas Sneakers",
      "price": "₹3499",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Puma Running Shoes",
      "price": "₹2599",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Reebok Sports",
      "price": "₹2799",
      "image": "https://via.placeholder.com/150"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Grid")),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 🔥 constraint from parent
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, String> product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔥 Image takes full width (constraint applied)
          SizedBox(
            height: 120,
            width: double.infinity,
            child: Image.network(
              product["image"]!,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 8),

          // 🔥 Text constrained → avoids overflow
          Text(
            product["name"]!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 4),

          Text(
            product["price"]!,
            style: const TextStyle(color: Colors.green),
          ),

          const Spacer(),

          // 🔥 Button expands within constraints
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Add to Cart"),
            ),
          ),
        ],
      ),
    );
  }
}

/*

Parent → gives constraints
Child → picks a size within them
Parent → positions the child

1)Tight constraint - Child MUST take exact size given by parent
Example:
SizedBox(
  width: 200,
  height: 100,
  child: Container(color: Colors.blue),
)

2)Loose constraint - Child can choose ANY size within a range (Flexible)
Example:
Center(
  child: Container(
    width: 100,
    height: 50,
    color: Colors.red,
  ),
)

3)Unbounded Constraints - Parent gives infinite space in one direction
Expanded(
  child: ListView(),
)

Error case
Column(
  children: [
    ListView(), // ❌
  ],
)

Using Expanded overflow cause
Solution 1: Make it scrollable - Now it scrolls horizontally/Vertically
Solution 2: Use Wrap - Moves to next line automatically
Solution 3: Use ListView (Best for performance) - Efficient + scrollable

Expanded → gives space
Row → arranges children
Too many children → overflow

GridView (Parent)
Gives equal width to each card (2 columns)

ProductCard (Child)
Must fit inside given grid size

Image
Takes full width but fixed height → respects constraints

Text
Uses maxLines + ellipsis → prevents overflow

Button
width: double.infinity → expands within allowed space
*/
