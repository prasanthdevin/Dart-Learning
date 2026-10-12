import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CombinedDemo(),
    );
  }
}

class CombinedDemo extends StatelessWidget {
  const CombinedDemo({super.key});

  @override
  Widget build(BuildContext context) {

    // 🔥 MediaQuery (GLOBAL screen info)
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(title: const Text("MediaQuery + LayoutBuilder")),

      body: LayoutBuilder(
        builder: (context, constraints) {

          // 🔥 LayoutBuilder (LOCAL available space)
          double localWidth = constraints.maxWidth;

          return Column(
            children: [

              // 🔷 Show device type using MediaQuery
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                color: Colors.black12,
                child: Text(
                  isTablet ? "Tablet Layout (MediaQuery)" : "Mobile Layout (MediaQuery)",
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 10),

              // 🔷 Responsive UI using LayoutBuilder
              Expanded(
                child: localWidth > 400
                    ? Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                        child: const Center(child: Text("Left Panel")),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.green,
                        child: const Center(child: Text("Right Panel")),
                      ),
                    ),
                  ],
                )
                    : Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.red,
                        child: const Center(child: Text("Top Panel")),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.orange,
                        child: const Center(child: Text("Bottom Panel")),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


/****************** MediaQuery *****************/

/*
MediaQuery = screen information provider

screenWidth * 0.5 → takes 50% of screen width
screenHeight * 0.3 → takes 30% of screen height

🔷 🔥 Orientation Example

var orientation = MediaQuery.of(context).orientation;
if (orientation == Orientation.portrait) {
  print("Portrait mode");
} else {
  print("Landscape mode");
}



🔷 🔥 Realtime example
👉 Responsive grid:
int crossAxisCount = MediaQuery.of(context).size.width > 600 ? 4 : 2;

Mobile → 2 columns
Tablet → 4 columns
*/


/****************** LayoutBuilder *****************/
/*
LayoutBuilder gives you the size (constraints) of the parent widget

👉 LayoutBuilder tells:
“How much space THIS widget is allowed to use”

Basic Syntax
LayoutBuilder(
  builder: (context, constraints) {
    return Widget();
  },
)

Use MediaQuery → for screen-level decisions
Use LayoutBuilder → for local (parent) constraints
*/
