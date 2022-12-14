import 'package:flutter/material.dart';

import 'screen_controller.dart';

// ignore: must_be_immutable
abstract class ScreenInjection<T extends ScreenController> extends InheritedWidget {
  T? controller;

  ScreenInjection({Key? key, this.controller, required Builder child}) : super(key: key, child: child);

  static I of<I extends ScreenInjection>(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<I>();
    assert(result != null, "No injection found on context");
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget);
}