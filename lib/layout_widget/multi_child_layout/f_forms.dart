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
      home: LoginFormDemo(),
    );
  }
}

class LoginFormDemo extends StatefulWidget {
  const LoginFormDemo({super.key});

  @override
  State<LoginFormDemo> createState() => _LoginFormDemoState();
}

class _LoginFormDemoState extends State<LoginFormDemo> {

  // 🔥 Form Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  void submit() {
    // 🔥 Validate form
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
A Form in Flutter is a widget used to collect, validate and manage user input fields,
while global key provide access to the form's state allowing operations like
validation, saving , group multiple fields together, manage form state easily and resetting fields.

Form = Container for input fields + validation + saving data

👉 It works with:

TextFormField
FormState
GlobalKey<FormState>


🔥 🎯 Why we use Form?
✔ Validate user input (email, password, etc.)
✔ Save input data
✔ Group multiple fields together
✔ Manage form state easily

🔥 ⏰ When to use Form
✔ Login / Signup screens
✔ Payment forms
✔ Address forms
✔ Any multi-input UI

🔥 ❌ When NOT to use
❌ Single simple input (use TextField)
❌ No validation required
*/
