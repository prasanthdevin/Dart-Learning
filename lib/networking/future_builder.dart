import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//////////////////////////////////////////////////////////////
// 🔥 APP
//////////////////////////////////////////////////////////////

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilderDemo(),
    );
  }
}

//////////////////////////////////////////////////////////////
// 🔥 SCREEN
//////////////////////////////////////////////////////////////

class FutureBuilderDemo extends StatelessWidget {
  const FutureBuilderDemo({super.key});

  // 🔥 Simulated API call
  Future<List<String>> fetchUsers() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate delay
    return ["Prasanth", "Rahul", "Kumar"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FutureBuilder Example")),

      body: FutureBuilder<List<String>>(

        future: fetchUsers(), // 🔥 async function

        builder: (context, snapshot) {

          // 🔄 LOADING
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // ❌ ERROR
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          // ✅ SUCCESS
          final users = snapshot.data!;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(users[index]),
              );
            },
          );
        },
      ),
    );
  }
}








/*
🔥 🧠 Simple Understanding
FutureBuilder = Wait for data → then build UI

👉 It handles:

Loading ⏳
Success ✅
Error ❌

🔥 🎯 Why we use FutureBuilder?
✔ API calls (HTTP request)
✔ Database fetch
✔ File loading
✔ Any async operation

🔥 🧠 Key Concept
Future = data that will come later
FutureBuilder = widget that waits for it

🔥 📦 Structure
FutureBuilder(
  future: yourFuture,
  builder: (context, snapshot) {
    // build UI
  },
)


🔥 📊 Snapshot States
State         	Meaning
waiting	        Loading
done	          Completed
hasError	      Error occurred
hasData       	Data available

🔥 🎯 WHEN to use FutureBuilder
✔ One-time data fetch
✔ API call on screen load
✔ Static async data

🔥 ❌ WHEN NOT to use
❌ Real-time updates → use StreamBuilder
❌ Frequent updates → use state management
*/
