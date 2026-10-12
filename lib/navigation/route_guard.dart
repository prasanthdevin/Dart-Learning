import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//////////////////////////////////////////////////////////////
// 🔥 FAKE AUTH STATE (SIMULATION)
//////////////////////////////////////////////////////////////

class AuthService {
  static bool isLoggedIn = false;
}

//////////////////////////////////////////////////////////////
// 🔥 ROUTES WITH GUARD
//////////////////////////////////////////////////////////////

class AppRoutes {
  static const home = '/';
  static const login = '/login';
  static const profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {

    // 🔷 HOME (always accessible)
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

    // 🔷 LOGIN
      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

    // 🔥 PROFILE (PROTECTED ROUTE)
      case profile:

      // 🔐 ROUTE GUARD
        if (!AuthService.isLoggedIn) {
          return MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          );
        }

        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Page not found")),
          ),
        );
    }
  }
}

//////////////////////////////////////////////////////////////
// 🔥 APP
//////////////////////////////////////////////////////////////

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.generateRoute,
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
            // 🔥 Try accessing protected screen
            Navigator.pushNamed(context, AppRoutes.profile);
          },
          child: const Text("Go to Profile"),
        ),
      ),
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
            // 🔥 Login success
            AuthService.isLoggedIn = true;

            // 🔥 Navigate to Profile after login
            Navigator.pushReplacementNamed(
                context, AppRoutes.profile);
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
// 🔥 PROFILE SCREEN (PROTECTED)
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
            // 🔥 Logout
            AuthService.isLoggedIn = false;

            Navigator.pushReplacementNamed(
                context, AppRoutes.login);
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}





/*
Route Guard is a technique used to restrict access to certain screens
based on conditions like authentication (login status).

🔥 📊 FLOW
User clicks Profile
      ↓
Check login status
      ↓
❌ Not logged in → Login screen
      ↓
User logs in
      ↓
Navigate to Profile
*/
