import 'package:flutter/material.dart';

void main() {
  runApp(const SpacerDemoApp());
}

class SpacerDemoApp extends StatelessWidget {
  const SpacerDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpacerHomeScreen(),
    );
  }
}

class SpacerHomeScreen extends StatelessWidget {
  const SpacerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Spacer Sample Project")),

      body: Column(
        children: [

          // 🔷 Example 1: Push button to bottom
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "Example 1: Button at Bottom",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: Column(
              children: [
                const Text("Welcome to Login Screen"),

                // 🔥 Spacer pushes button down
                const Spacer(),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Login"),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          const Divider(),

          // 🔷 Example 2: Left - Right alignment
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "Example 2: Left & Right",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Left"),
              ),

              Spacer(), // 🔥 pushes right text to end

              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Right"),
              ),
            ],
          ),

          const Divider(),

          // 🔷 Example 3: Multiple Spacer (flex)
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "Example 3: Multiple Spacer",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          Row(
            children: const [
              Text("A"),

              Spacer(flex: 1),

              Text("B"),

              Spacer(flex: 3),

              Text("C"),
            ],
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

/*
flex decides HOW MUCH space a widget takes compared to others

Total space is divided based on flex values

🔵 flex: 1,1,1
All equal width

Space distributed 1:3 ratio
But child still respects content

🔥 Flexible vs Expanded with flex
Widget	                            Behavior
Flexible(flex: x)	            Takes proportion but can shrink
Expanded(flex: x)	            MUST fill proportion
*/
