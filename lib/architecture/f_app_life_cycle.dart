import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    debugPrint("STATE CHANGE: $state");

    switch (state) {
      case AppLifecycleState.resumed:
        debugPrint("LIFECYCLE Resumed: App in Foreground");
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showToast("App in Foreground");
        });
        break;

      case AppLifecycleState.inactive:
        debugPrint("LIFECYCLE InActive: App Inactive");
        showToast("App Inactive");
        break;

      case AppLifecycleState.hidden:
        debugPrint("LIFECYCLE Hidden: App Hidden");
        break;

      case AppLifecycleState.paused:
        debugPrint("LIFECYCLE Paused: App in Background");
        showToast("App in Background");
        break;

      case AppLifecycleState.detached:
        debugPrint("LIFECYCLE Detached: App Detached");
        break;
    }
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Lifecycle Demo")),
        body: Center(child: Text("Check console logs")),
      ),
    );
  }
}

/*
Your didChangeAppLifecycleState() will NOT trigger resumed initially
App → background → foreground ✅ Yes
resumed → toast ONLY when coming back from background


 State	                 When it happens	                                  Your Log	          Toast
resumed	     App returns from background (NOT initial launch)	          App in Foreground	       ✅
inactive	   Temporary interruption (call, notification, app switch)	  App Inactive	           ✅
paused	     App goes to background (home button, recent apps)	        App in Background      	 ✅
hidden	     App fully hidden (Android 12+ / some devices)	               App Hidden	           ❌
detached	   App is terminated / removed from system	                     App Detached	         ❌

*/
