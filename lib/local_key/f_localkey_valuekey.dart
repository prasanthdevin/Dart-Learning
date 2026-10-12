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
      home: KeyAddItemDemo(),
    );
  }
}

class KeyAddItemDemo extends StatefulWidget {
  const KeyAddItemDemo({super.key});

  @override
  State<KeyAddItemDemo> createState() => _KeyAddItemDemoState();
}

class _KeyAddItemDemoState extends State<KeyAddItemDemo> {
  List<Item> items = [
    Item("A"),
    Item("B"),
    Item("C"),
  ];

  bool useKey = false;
  int counter = 1;

  void addItem() {
    setState(() {
      // 🔥 Add at TOP (important to see issue clearly)
      items.insert(0, Item("New ${counter++}"));
    });
  }

  void toggleKey() {
    setState(() {
      useKey = !useKey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Item Key Demo")),

      body: Column(
        children: [

          const SizedBox(height: 20),

          // 🔥 Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: addItem,
                child: const Text("Add Item (Top)"),
              ),
              ElevatedButton(
                onPressed: toggleKey,
                child: Text(useKey ? "Using Key" : "Without Key"),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Expanded(
            child: ListView(
              children: items.map((item) {
                return ItemBox(
                  key: useKey ? ValueKey(item.name) : null, // 🔥 KEY
                  item: item,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// 🔷 DATA MODEL
class Item {
  final String name;

  Item(this.name);
}

// 🔷 STATEFUL ITEM
class ItemBox extends StatefulWidget {
  final Item item;

  const ItemBox({super.key, required this.item});

  @override
  State<ItemBox> createState() => _ItemBoxState();
}

class _ItemBoxState extends State<ItemBox> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.item.name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Count: $count"),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                count++;
              });
            },
          ),
        ],
      ),
    );
  }
}

/*
This code uses a ValueKey, which is a LocalKey,
to uniquely identify list items and maintain correct state during list updates.

A ValueKey is a key that uses a value (like int, String, or object) to differentiate one widget from another.

Why Use ValueKey?
Flutter rebuilds UI frequently. When widgets change, it needs to know:
Which widget is new
Which widget is updated
Which widget should keep its state

When to use?
You have lists
Widgets may reorder
You want to preserve state correctly
*/
