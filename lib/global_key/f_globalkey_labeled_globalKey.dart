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
      home: MultiKeyDebugDemo(),
    );
  }
}

class MultiKeyDebugDemo extends StatefulWidget {
  const MultiKeyDebugDemo({super.key});

  @override
  State<MultiKeyDebugDemo> createState() => _MultiKeyDebugDemoState();
}

class _MultiKeyDebugDemoState extends State<MultiKeyDebugDemo> {

  // 🔥 MULTIPLE LABELED KEYS
  final GlobalKey formKey =
  GlobalKey(debugLabel: "LoginForm");

  final GlobalKey emailFieldKey =
  GlobalKey(debugLabel: "EmailField");

  final GlobalKey profileSectionKey =
  GlobalKey(debugLabel: "ProfileSection");

  void printAllKeys() {
    debugPrint("Form Key: $formKey");
    debugPrint("Email Field Key: $emailFieldKey");
    debugPrint("Profile Section Key: $profileSectionKey");

    if (formKey.currentContext != null) {
      debugPrint("LoginForm FOUND");
    }
    if (emailFieldKey.currentContext != null) {
      debugPrint("EmailField FOUND");
    }
    if (profileSectionKey.currentContext != null) {
      debugPrint("ProfileSection FOUND");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Multiple Labeled Keys")),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // 🔷 Profile Section
            Container(
              key: profileSectionKey,
              height: 150,
              color: Colors.blue.shade100,
              alignment: Alignment.center,
              child: const Text("Profile Section"),
            ),

            const SizedBox(height: 20),

            // 🔷 Form
            Form(
              key: formKey,
              child: Column(
                children: [

                  // 🔷 Email Field
                  TextFormField(
                    key: emailFieldKey,
                    decoration: const InputDecoration(labelText: "Email"),
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    decoration: InputDecoration(labelText: "Password"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: printAllKeys,
              child: const Text("Print Debug Info"),
            ),
          ],
        ),
      ),
    );
  }
}


/*
LabeledGlobalKey is a type of GlobalKey that includes a debug label,
used to identify widgets clearly in debugging and error messages.

🔥 🎯 When is it used?

👉 Mainly for:

✔ Debugging widget tree
✔ Understanding errors
✔ Large apps with multiple GlobalKeys
✔ Logging / tracing issues

🔥 ⏰ WHEN to use
✔ Large applications
✔ Multiple GlobalKeys
✔ Debugging complex UI
✔ Finding duplicate key errors

🔥 ❌ WHEN NOT to use
❌ Small apps
❌ Normal use cases
❌ Production logic (not required)

*/
