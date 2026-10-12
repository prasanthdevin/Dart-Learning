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
      home: UniqueKeyDemo(),
    );
  }
}

class UniqueKeyDemo extends StatefulWidget {
  const UniqueKeyDemo({super.key});

  @override
  State<UniqueKeyDemo> createState() => _UniqueKeyDemoState();
}

class _UniqueKeyDemoState extends State<UniqueKeyDemo> {
  List<Item> items = [
    Item("Apple"),
    Item("Banana"),
    Item("Mango"),
  ];

  bool useKey = false;
  int counter = 1;

  void addItem() {
    setState(() {
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
      appBar: AppBar(title: const Text("UniqueKey Demo")),

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
                child: Text(useKey ? "Using UniqueKey" : "Without Key"),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Expanded(
            child: ListView(
              children: items.map((item) {
                return ItemBox(
                  key: useKey ? UniqueKey() : null, // 🔥 UNIQUE KEY
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
Always generates a unique key, flutter treats widgets as completely new every time.

🔹 How It Works
Every time you create UniqueKey(), it generates a new identity
Even if widgets look identical, Flutter treats them as completely different


🔹 Why Use UniqueKey?

Use it when:

You want to force widget rebuild
You don’t want Flutter to reuse old widget state
Widgets should always be treated as new



🔹 Why Use UniqueKey?

Use it when:

You want to force widget rebuild
You don’t want Flutter to reuse old widget state
Widgets should always be treated as new


🔹 When NOT to Use
Avoid using UniqueKey when:

You need to preserve state
You want Flutter to track widgets efficiently

👉 Because it breaks widget reuse and can affect performance.

👉 UniqueKey = Always new identity (no reuse, no match)



*/
