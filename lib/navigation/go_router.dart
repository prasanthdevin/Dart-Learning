import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

//////////////////////////////////////////////////////////////
// 🔥 ROUTER CONFIG
//////////////////////////////////////////////////////////////

final GoRouter _router = GoRouter(
  routes: [

    // 🔷 Home
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    // 🔷 Product List
    GoRoute(
      path: '/product',
      builder: (context, state) => const ProductScreen(),
    ),

    // 🔷 Product Detail
    GoRoute(
      path: '/detail',
      builder: (context, state) => const DetailScreen(),
    ),

    // 🔷 Profile
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);

//////////////////////////////////////////////////////////////
// 🔥 APP
//////////////////////////////////////////////////////////////

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router, // 🔥 attach router
      debugShowCheckedModeBanner: false,
    );
  }
}

//////////////////////////////////////////////////////////////
// 🔥 SCREENS
//////////////////////////////////////////////////////////////

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          ElevatedButton(
            onPressed: () {
              context.go('/product'); // 🔥 declarative navigation
            },
            child: const Text("Go to Products"),
          ),

          ElevatedButton(
            onPressed: () {
              context.go('/profile');
            },
            child: const Text("Go to Profile"),
          ),
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////////////

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/detail'); // 🔥 navigate
          },
          child: const Text("Go to Detail"),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail")),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/'); // 🔥 back to home
          },
          child: const Text("Back to Home"),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/');
          },
          child: const Text("Back to Home"),
        ),
      ),
    );
  }
}



/*

GoRouter is a declarative routing package in Flutter built on top of Navigator 2.0
that simplifies navigation, deep linking, and route management.
It allows developers to manage navigation using URL-like routes and application state,
providing a clean, structured, and scalable approach for handling routing,
especially in web and complex applications.

👉 Navigation becomes:

URL based + State based

dependencies:
  go_router: ^14.0.0

🔥 🧠 Short Version (Easy to remember)
GoRouter = Declarative + URL-based + Scalable navigation
*/
