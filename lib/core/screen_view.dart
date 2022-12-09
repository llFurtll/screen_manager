import 'package:compmanager/core/screen_component.dart';
import 'package:flutter/material.dart';

import 'screen_controller.dart';
import 'screen_injection.dart';

abstract class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  ScreenInjection build(BuildContext context);
}

// ignore: must_be_immutable
abstract class ScreenView<T extends ScreenController, I extends ScreenInjection<T>> extends StatelessWidget {
  T? controller;
  List<ScreenComponent>? components;

  ScreenView({Key? key}) : super(key: key);

  void _injection(BuildContext context) {
    controller = ScreenInjection.of<I>(context).controller;
    components = ScreenInjection.of<I>(context).components;
    if (controller != null) {
      controller!.setContext(context);
      controller!.onInit();
      if (components != null) {
        for (var component in components!) {
          component.setController(controller!);
        }
      }
    }
  }

  @mustCallSuper
  @override
  Widget build(BuildContext context) {
    _injection(context);

    return const Scaffold();
  }
}