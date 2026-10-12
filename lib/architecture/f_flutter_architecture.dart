import 'package:flutter/material.dart';

void main() {
  runApp(CounterScreen());
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    print("Build called");
    return Scaffold(
      appBar: AppBar(title: Text("Counter")),
      body: Center(child: Text("Count: $count")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++; // State change
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// ******** Explanation for Build Phase *********

/*
What happens internally?

1.User taps button
2.setState() is called
3.Flutter marks this widget’s Element as dirty
4.build() runs again → new Widget tree is created
5.Flutter compares old vs new widgets (diffing)
6.Updates Element tree (reused where possible)
7.Updates RenderObject tree only if needed
8.UI updates → only the text changes
*/

//  ******** Explanation for Layout Phase ********

//Container(
//   width: 200,
//   height: 100,
//   color: Colors.blue,
//   child: Center(
//     child: Text("Hello"),
//   ),
// )

/*
What happens internally?
Parent gives constraints → Child chooses size → Parent positions child
1.Parent gives constraints to Container
2.Container decides size → 200x100
3.Center takes available space
4.Text gets size based on content
5.Everything gets positioned properly
*/

// Paint phase
// Composition Phase
// Rasterization Phase

// JIT vs AOT
/*
JIT → Cooking while eating 🍳
AOT → Cooking before serving 🍽️
*/









