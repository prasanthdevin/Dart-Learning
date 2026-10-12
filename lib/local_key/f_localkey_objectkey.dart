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
      home: ObjectKeyDemo(),
    );
  }
}

class ObjectKeyDemo extends StatefulWidget {
  const ObjectKeyDemo({super.key});

  @override
  State<ObjectKeyDemo> createState() => _ObjectKeyDemoState();
}

class _ObjectKeyDemoState extends State<ObjectKeyDemo> {
  List<Item> items = [
    Item("Apple"),
    Item("Banana"),
    Item("Mango"),
  ];

  bool useKey = false;
  int counter = 1;

  void addItem() {
    setState(() {
      // 🔥 Add new item at TOP
      items.insert(0, Item("New Fruit ${counter++}"));
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
      appBar: AppBar(title: const Text("ObjectKey Demo")),

      body: Column(
        children: [

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: addItem,
                child: const Text("Add Fruit (Top)"),
              ),
              ElevatedButton(
                onPressed: toggleKey,
                child: Text(useKey ? "Using ObjectKey" : "Without Key"),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Expanded(
            child: ListView(
              children: items.map((item) {
                return ItemBox(
                  key: useKey ? ObjectKey(item) : null, // 🔥 OBJECT KEY
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
An ObjectKey is a key that uses an entire object (not just a simple value) to identify a widget.


How It Works?
Flutter compares the object reference
Two ObjectKeys are equal only if they refer to the same object


🔹 Why Use ObjectKey?
Use it when:

You are working with custom objects (models)
Each widget represents a specific object instance
You want Flutter to track widgets using object identity


🔹 Difference from ValueKey
ValueKey → compares by value
ObjectKey → compares by object (instance)

👉 ObjectKey = Identity based on object instance
*/
