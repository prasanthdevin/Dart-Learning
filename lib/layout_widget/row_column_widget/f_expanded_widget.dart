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
      home: SearchScreen(),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Example")),

      body: Column(
        children: [
          // 🔷 Search Bar (Row + Expanded)
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Icon(Icons.search),

                // 🔥 Expanded used here
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search products...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                ),

                const SizedBox(width: 10),
                const Icon(Icons.mic),
              ],
            ),
          ),

          // 🔷 Product List (Expanded + ListView)
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.shopping_bag)),
                  title: Text("Product ${index + 1}"),
                  subtitle: const Text("₹999"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/*
🔥 Common Mistake

❌ Using width inside Expanded:

Expanded(
child: Container(width: 100) // ❌ ignored
)*/
