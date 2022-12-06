

import 'package:compmanager/screen_controller.dart';
import 'package:compmanager/screen_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends ScreenView<MyAppController> {
  MyApp({Key? key}) : super(key: key, creator: () => MyAppController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("LEGAL")),
    );
  }
}

class MyAppController extends ScreenController {
  void back() {
    Navigator.of(context).pop();
  }
}