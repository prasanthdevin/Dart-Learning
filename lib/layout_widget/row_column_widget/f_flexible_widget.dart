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
      home: FlexVsExpandedDemo(),
    );
  }
}

class FlexVsExpandedDemo extends StatelessWidget {
  const FlexVsExpandedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flexible vs Expanded")),

      body: Column(
        children: [

          const SizedBox(height: 20),

          // 🔴 FLEXIBLE EXAMPLE
          const Text(
            "Flexible (Takes only needed space)",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Flexible(
                child: Container(
                  height: 100,
                  color: Colors.red,
                  child: const Text("Short"),
                ),
              ),
              Flexible(
                child: Container(
                  height: 100,
                  color: Colors.green,
                  child: const Text("This is a longer text"),
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // 🔵 EXPANDED EXAMPLE
          const Text(
            "Expanded (Takes FULL available space)",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.red,
                  child: const Text("Short"),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.green,
                  child: const Text("This is a longer text"),
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // 🟡 MIXED EXAMPLE
          const Text(
            "Mixed (Flexible + Fixed + Expanded)",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Flexible(
                child: Container(
                  height: 100,
                  color: Colors.orange,
                  child: const Text("Flexible"),
                ),
              ),

              Container(
                width: 80,
                height: 100,
                color: Colors.black,
                child: const Center(
                  child: Text("Fixed", style: TextStyle(color: Colors.white)),
                ),
              ),

              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.blue,
                  child: const Text("Expanded"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}









/*
flex = space ratio controller

Flexible allows a child to take available space but NOT force it

👉 It works inside:
Row / Column / Flex


🔴 Flexible
✔ Takes ONLY needed space
✔ Size depends on content
✔ Doesn’t force fill


👉 Red box = small
👉 Green box = bigger (because text is longer)

🔵 Expanded
✔ Takes FULL available space
✔ Divides equally
✔ Ignores content size

Flexible = Adjust based on content
Expanded = Force fill available space



🔷 🔥 Flexible vs Expanded (IMPORTANT)
Feature	                 Flexible	  Expanded
Forces full space	        ❌ No	     ✅ Yes
Takes only needed space	  ✅ Yes	   ❌ No
Flex control	            ✅ Yes	   ✅ Yes
*/
