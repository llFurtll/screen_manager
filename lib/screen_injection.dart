import 'package:flutter/material.dart';

import 'screen_controller.dart';
import 'screen_receive.dart';
import 'screen_view.dart';

abstract class ScreenInjection<T extends ScreenController> extends InheritedWidget {
  final T controller;
  final ScreenReceiveArgs receiveArgs;
  final BuildContext? context;

  ScreenInjection({
    Key? key,
    required this.controller,
    this.receiveArgs = const ScreenReceiveArgs(identity: "", receive: false),
    required ScreenBridge child,
    this.context
  }) : super(
    key: key,
    child: child
  ) {
    dependencies(context);
  }

  static I of<I extends ScreenInjection>(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<I>();
    assert(result != null, "No injection found on context");
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget);

  void dependencies(BuildContext? context) {}
}