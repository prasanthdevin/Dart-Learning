import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScrollToWidgetDemo(),
    );
  }
}

class ScrollToWidgetDemo extends StatelessWidget {
  ScrollToWidgetDemo({super.key});

  // 🔥 GENERIC GLOBAL KEY
  final GlobalKey targetKey = GlobalKey();

  void scrollToTarget(BuildContext context) {
    final context = targetKey.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scroll to Item Demo")),

      floatingActionButton: FloatingActionButton(
        onPressed: () => scrollToTarget(context),
        child: const Icon(Icons.arrow_downward),
      ),

      body: ListView(
        children: List.generate(30, (index) {
          if (index == 20) {
            return Container(
              key: targetKey, // 🔥 attach key here
              height: 100,
              color: Colors.red,
              alignment: Alignment.center,
              child: const Text(
                "TARGET ITEM",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          }

          return Container(
            height: 80,
            margin: const EdgeInsets.all(8),
            color: Colors.grey.shade300,
            alignment: Alignment.center,
            child: Text("Item $index"),
          );
        }),
      ),
    );
  }
}



/*

Generic GlobalKey is used to uniquely identify a widget globally
and access its BuildContext or position, but NOT a specific state type.

OR

Generic GlobalKey is used to locate a widget and access its BuildContext globally,
commonly used for scrolling, positioning, and layout measurements.”



Why Generic GlobalKey used?
We don’t need state (FormState, ScaffoldState)
We only need to LOCATE the widget


🔥 📍 WHERE to use Generic GlobalKey

1.Scroll to specific widget
👉 Jump to error field in form
👉 Scroll to product section
👉 Scroll to chat message

2.Get widget position / size
👉 Tooltip positioning
👉 Popup alignment
👉 Custom dropdown

3.Focus on a widget
👉 Auto scroll to TextField
👉 Highlight selected item

4.Measure widget after build
👉 Get height / width
👉 Layout calculations

🔥 ⏰ WHEN to use
✔ When you need BuildContext of a widget
✔ When you want to scroll to a widget
✔ When you want widget position/size
✔ When widget is not easily reachable

🔥 ❌ WHEN NOT to use
❌ For form validation → use GlobalKey<FormState>
❌ For list items → use ValueKey
❌ For state management → use Provider/Bloc
❌ For simple UI updates

🔥 🧠 REAL UNDERSTANDING
Generic GlobalKey = "Where is this widget?"
Typed GlobalKey = "Control this widget"
*/
