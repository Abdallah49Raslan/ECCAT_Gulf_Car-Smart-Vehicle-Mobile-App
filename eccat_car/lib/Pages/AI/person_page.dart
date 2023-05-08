// ignore_for_file: prefer_const_constructors

// import 'package:application_1/src/navigation_controls.dart';
// import 'package:application_1/src/web_view_stack.dart';
import 'package:eccat_car/Pages/src/navigation_controls.dart';
import 'package:eccat_car/Pages/src/web_view_stack.dart';
import 'package:flutter/material.dart';

// class PersonPage extends StatefulWidget {
//   const PersonPage({super.key});

//   @override
//   State<PersonPage> createState() => _PersonPageState();
// }

// class _PersonPageState extends State<PersonPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightBlue,
//       body: Center(child: Text('Person',style: TextStyle(fontSize: 50),),),
//     );
//   }
// }

import 'package:flutter/material.dart';
// import 'package:web_app/src/web_view_stack.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'src/web_view_stack.dart';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// import 'src/web_view_stack.dart';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart'; // ADD

// import 'src/navigation_controls.dart';                  // ADD
// import 'src/web_view_stack.dart';

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  // Add from here...
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://shbabbek.com/show/209705'),
      );
  }
  // ...to here.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suez Canal University'),
        // Add from here...
        actions: [
          NavigationControls(controller: controller),
        ],
        // ...to here.
      ),
      body: Container(child: WebViewStack(controller: controller)), // MODIFY
    );
  }
}
