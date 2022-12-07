

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.message),
          onPressed: () => controller.message(),
        ),
      ),
      body: const Center(child: Text("LEGAL")),
    );
  }
}

class MyAppController extends ScreenController {
  @override
  void onInit() {
    super.onInit();
    print("LEGAL");
  }

  @override
  void onReady() {
    super.onReady();
    print("READY");
  }

  void message() {
    ScaffoldMessenger.of(state.context).showSnackBar(const SnackBar(content: Text("LEGAL")));
  }
}