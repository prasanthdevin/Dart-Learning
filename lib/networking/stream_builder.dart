import 'dart:async';
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
      home: StreamBuilderDemo(),
    );
  }
}

//////////////////////////////////////////////////////////////
// 🔥 STREAM BUILDER DEMO
//////////////////////////////////////////////////////////////

class StreamBuilderDemo extends StatelessWidget {
  const StreamBuilderDemo({super.key});

  // 🔥 Create a stream (emits value every second)
  Stream<int> counterStream() async* {
    int count = 0;

    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield count++; // 🔥 emit value
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("StreamBuilder Example")),

      body: Center(
        child: StreamBuilder<int>(
          stream: counterStream(), // 🔥 attach stream

          builder: (context, snapshot) {

            // ⏳ WAITING
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            // ❌ ERROR
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }

            // ✅ DATA (REAL-TIME UPDATE)
            return Text(
              "Count: ${snapshot.data}",
              style: const TextStyle(fontSize: 30),
            );
          },
        ),
      ),
    );
  }
}

/*
🔥 🧠 Simple Understanding
FutureBuilder → One-time data
StreamBuilder → Continuous updates

👉 Example:

Chat messages
Live stock price
Firebase realtime data
Timer updates


🔥 🎯 Why use StreamBuilder?
✔ Real-time UI updates
✔ Continuous data flow
✔ No manual refresh needed


🔥 📦 Structure
StreamBuilder(
  stream: yourStream,
  builder: (context, snapshot) {
    // build UI
  },
)


🔥 📊 Snapshot States
State	        Meaning
waiting	      Initial loading
active	      Receiving data
done	        Stream completed
hasError	    Error
*/
