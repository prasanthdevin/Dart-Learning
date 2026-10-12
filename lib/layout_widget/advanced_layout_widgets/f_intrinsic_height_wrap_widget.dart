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
      home: IntrinsicHeightDemo(),
    );
  }
}

class IntrinsicHeightDemo extends StatelessWidget {
  const IntrinsicHeightDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("IntrinsicHeight Demo")),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔥 Top Section (IntrinsicHeight)
            IntrinsicHeight(
              child: Row(
                children: [

                  // 🔷 Card 1
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(12),
                      color: Colors.green.shade300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Basic Plan",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text("₹99"),
                        ],
                      ),
                    ),
                  ),

                  // 🔷 Card 2
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(12),
                      color: Colors.orange.shade300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Premium Plan",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text("₹199"),
                          SizedBox(height: 10),
                          Text("Extra Features Included"),
                          Text("Priority Support"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔥 Bottom Section (Wrap)
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(10, (index) {
                return Chip(
                  label: Text("Feature ${index + 1}"),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}


/*
IntrinsicHeight - It forces its child to take the height of the tallest child

👉 Mainly used when:

Children in a Row have different heights
You want them to match the same height

🔷 🔥 How it works internally:-
1. Measures all children height
2. Finds tallest child
3. Applies that height to all children

👉 Result:

Both cards same height
UI looks clean
*/
