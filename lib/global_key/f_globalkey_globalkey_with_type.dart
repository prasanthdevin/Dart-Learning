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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // 🔥 GLOBAL KEY WITH TYPE
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  void submit() {
    // 🔥 Access FormState using GlobalKey
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Success: $email")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Form")),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: _formKey, // 🔥 Attach key

          child: Column(
            children: [

              // 🔷 Email Field
              TextFormField(
                decoration: const InputDecoration(labelText: "Email"),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Email";
                  }
                  return null;
                },

                onSaved: (value) {
                  email = value!;
                },
              ),

              const SizedBox(height: 20),

              // 🔷 Password Field
              TextFormField(
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,

                validator: (value) {
                  if (value == null || value.length < 6) {
                    return "Password must be 6+ chars";
                  }
                  return null;
                },

                onSaved: (value) {
                  password = value!;
                },
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: submit,
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



/*
GlobalKey<T> is used to uniquely identify a widget globally
and allows access to its specific State (T) to call methods or control it.

🔥 🧠 Simple Understanding
GlobalKey() → Find widget (context only)
GlobalKey<T> → Find + Control widget state


🔥 📍 WHERE to use GlobalKey<T>
✅ Real-world usage
Form validation → GlobalKey<FormState>
Open drawer → GlobalKey<ScaffoldState>
Navigation → GlobalKey<NavigatorState>

🔥 ⏰ WHEN to use
✔ When you need access to specific widget state
✔ When you want to call methods (validate, openDrawer, push)
✔ When widget is not directly accessible

🔥 ❌ WHEN NOT to use
❌ For lists → use ValueKey
❌ For simple UI updates
❌ When context is enough
❌ Overusing (performance issue)

*/
