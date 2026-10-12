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
      home: CustomContainerDemo(),
    );
  }
}

class CustomContainerDemo extends StatelessWidget {
  const CustomContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Container Example")),

      body: ListView(
        children: const [

          CustomCard(title: "Card 1", color: Colors.blue),
          CustomCard(title: "Card 2", color: Colors.green),
          CustomCard(title: "Card 3", color: Colors.orange),

        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final Color color;

  const CustomCard({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),

        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(2, 3),
          ),
        ],
      ),

      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}