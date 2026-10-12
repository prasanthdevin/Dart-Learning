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
      home: LoginScreen(),
    );
  }
}

//////////////////////////////////////////////////////////////
// 🔥 LOGIN SCREEN
//////////////////////////////////////////////////////////////

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 🔥 pushReplacement (Login → Home)
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const HomeScreen(),
              ),
            );
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
// 🔥 HOME SCREEN
//////////////////////////////////////////////////////////////

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 🔥 push (Home → Detail)
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const DetailScreen(),
              ),
            );
          },
          child: const Text("Go to Product Detail"),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
// 🔥 DETAIL SCREEN
//////////////////////////////////////////////////////////////

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Detail")),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 🔥 pop (Detail → Home)
            Navigator.pop(context);
          },
          child: const Text("Go Back"),
        ),
      ),
    );
  }
}



/*
Navigator 1.0
Imperative navigation is a way of navigating between screens
by directly telling Flutter WHAT to do (push, pop, replace).

🔥 📦 Imperative APIs:-

Navigator.push()               -> Open new screen ON TOP
Navigator.pop()                -> Close current screen
Navigator.pushReplacement()    -> Replace current screen (no back)
❗ Why use here?
User should NOT go back to Login after login
*/


