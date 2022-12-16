import 'package:flutter/material.dart';

import 'screen_controller.dart';
import 'screen_injection.dart';

// ignore: must_be_immutable
abstract class ScreenWidget<T extends ScreenController, I extends ScreenInjection<T>> extends StatelessWidget {
  late T? _controller;

  ScreenWidget({Key? key, required BuildContext context}) : super(key: key) {
    if (T is! NoController) {
      _controller = ScreenInjection.of<I>(context).controller;
    }
  }

  T get controller {
    assert(_controller != null, "Controller has not been defined");
    return _controller!;
  }

  Widget constructor(BuildContext context);

  @override
  Widget build(BuildContext context) {
    onInit();

    return constructor(context);
  }

  /// This method is called before building the widget
  /// 
  /// This method uses WidgetsBinding, override the onReady method to run after build
  @mustCallSuper
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  /// Called after the Widget is built
  void onReady() {}
}