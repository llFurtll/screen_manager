import 'package:flutter/material.dart';

import 'screen_controller.dart';
import 'screen_receive.dart';
import 'screen_view.dart';

// ignore: must_be_immutable
abstract class ScreenInjection<T extends ScreenController> extends InheritedWidget {
  T controller;
  ScreenReceiveArgs receiveArgs;

  ScreenInjection({
    Key? key,
    required this.controller,
    this.receiveArgs = const ScreenReceiveArgs(identity: "", receive: false),
    required ScreenParams child
  }) : super(
    key: key,
    child: child
  );

  static I of<I extends ScreenInjection>(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<I>();
    assert(result != null, "No injection found on context");
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget);
}