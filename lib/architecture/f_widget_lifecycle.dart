import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LifeCycleDemo(),
    );
  }
}

class LifeCycleDemo extends StatefulWidget {
  @override
  _LifeCycleDemoState createState() => _LifeCycleDemoState();
}

class _LifeCycleDemoState extends State<LifeCycleDemo> {
  @override
  void initState() {
    super.initState();
    debugPrint("WidgetLifeCycle : initState called");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("WidgetLifeCycle : didChangeDependencies called");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("WidgetLifeCycle :build called");

    return Scaffold(
      appBar: AppBar(title: Text("Lifecycle")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              debugPrint("WidgetLifeCycle : setState called");
            });
            /*Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const DisposeDeActivateMethod()),
            );*/
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DisposeDeActivateMethod()),
            );
          },
          child: Text("Click"),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    debugPrint("WidgetLifeCycle : deactivate called");
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint("WidgetLifeCycle : dispose called");
    super.dispose();
  }
}

class DisposeDeActivateMethod extends StatefulWidget {
  const DisposeDeActivateMethod({super.key});

  @override
  State<DisposeDeActivateMethod> createState() =>
      _DisposeDeActivateMethodState();
}

class _DisposeDeActivateMethodState
    extends State<DisposeDeActivateMethod> {

  @override
  void initState() {
    super.initState();
    debugPrint("SecondScreen: initState");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // 🔥 trigger dispose
          },
          child: const Text("Back"),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    debugPrint("SecondScreen: deactivate 🔥");
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint("SecondScreen: dispose 🔥");
    super.dispose();
  }
}

/*
👉 For a normal screen (route):
push()	            ❌	❌
pop()	              ✅	✅
pushReplacement() 	✅	✅
reorder widget      ✅  ❌
dispose NEVER happens without deactivate first
*/

/************** Refer main.dart **************/
