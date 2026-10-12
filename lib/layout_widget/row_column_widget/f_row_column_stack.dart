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
      home: LayoutDemo(),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Row vs Column vs Stack")),

      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 20),

            // 🔴 ROW EXAMPLE
            const Text(
              "ROW (Horizontal Layout)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                box(Colors.red, "1"),
                box(Colors.green, "2"),
                box(Colors.blue, "3"),
              ],
            ),

            const SizedBox(height: 40),

            // 🟢 COLUMN EXAMPLE
            const Text(
              "COLUMN (Vertical Layout)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Column(
              children: [
                box(Colors.orange, "A"),
                box(Colors.purple, "B"),
                box(Colors.teal, "C"),
              ],
            ),

            const SizedBox(height: 40),

            // 🔵 STACK EXAMPLE
            const Text(
              "STACK (Overlay Layout)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Center(
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [

                  // Base box
                  Container(
                    width: 200,
                    height: 200,
                    color: Colors.grey.shade300,
                  ),

                  // Bottom layer
                  Positioned(
                    bottom: 10,
                    child: box(Colors.red, "Bottom"),
                  ),

                  // Center layer
                  box(Colors.green, "Center"),

                  // Top layer
                  Positioned(
                    top: -20,
                    child: box(Colors.blue, "Top"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // 🔥 Reusable box widget
  Widget box(Color color, String text) {
    return Container(
      width: 80,
      height: 80,
      margin: const EdgeInsets.all(8),
      color: color,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}