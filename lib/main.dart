import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Demo()));
}

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  bool toggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Deactivate Demo")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                toggle = !toggle;
              });
            },
            child: const Text("Toggle"),
          ),

          // 🔥 IMPORTANT PART
          toggle
              ? const TestWidget(key: ValueKey("A"))
              : const TestWidget(key: ValueKey("B")),
        ],
      ),
    );
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {

  @override
  void deactivate() {
    debugPrint("deactivate called 🔥");
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint("dispose called ❌");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Text("Hello");
  }
}