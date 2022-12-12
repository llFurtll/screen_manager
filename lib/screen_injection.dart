import 'package:flutter/material.dart';

import 'screen_component.dart';
import 'screen_controller.dart';
import 'screen_view.dart';

// ignore: must_be_immutable
abstract class ScreenInjection<T extends ScreenController> extends InheritedWidget {
  T? controller;
  List<ScreenComponent> components;

  ScreenInjection({Key? key, this.controller, this.components = const [], required ScreenView child}) : super(key: key, child: child);

  static I of<I extends ScreenInjection>(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<I>();
    assert(result != null, "No injection found on context");
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget);
}