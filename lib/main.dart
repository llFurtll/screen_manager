

import 'package:compmanager/screen_injection.dart';
import 'package:flutter/material.dart';

import 'screen_controller.dart';
import 'screen_view.dart';

void main() {
  runApp(MaterialApp(
    home: Teste(),
  ));
}


class Teste extends Screen {
  const Teste({Key? key}) : super(key: key);

  @override
  Injection build(BuildContext context) {
    return Injection(
      message: "HELLO WORLD!",
      child: MyApp(),
    );
  }
}

class MyApp extends ScreenView<MyAppController> {
  MyApp({Key? key}) : super(key: key, creator: () => MyAppController());

  @override
  Widget build(BuildContext context) {
    print("BUILD");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.message),
          onPressed: () => controller.message(),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.isLoading,
        builder: (BuildContext context, bool value, Widget? widget) {
          if (value) {
            return const Center(child: CircularProgressIndicator());
          }

          return Center(child: Text(controller.getMessage));
        },
      ),
    );
  }
}

class MyAppController extends ScreenController {
  final isLoading = ValueNotifier(true);

  late String getMessage;

  @override
  void onInit() {
    super.onInit();
    print("INIT");
  }

  @override
  void onReady() {
    super.onReady();
    print("READY");
    getMessage = Injection.of(state.context).message;
    isLoading.value = false;
  }

  void message() {
    ScaffoldMessenger.of(state.context).showSnackBar(const SnackBar(content: Text("LEGAL")));
  }
}

class Injection extends ScreenInjection {
  final String message;
  
  const Injection({Key? key, required ScreenView child, required this.message}) : super(key: key, child: child);

  static Injection of(BuildContext context) {
    final Injection? result = context.dependOnInheritedWidgetOfExactType();
    assert(result != null, 'No Injection found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}