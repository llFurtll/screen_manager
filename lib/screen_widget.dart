import 'package:flutter/material.dart';

import 'screen_controller.dart';
import 'screen_manager_controller.dart';

abstract class ScreenWidget<C extends ScreenController> extends StatelessWidget {
  /// Use context when you want the widget to be rebuilt after calling the refresh method
  const ScreenWidget({Key? key, BuildContext? context}) : super(key: key);

  C get controller {
    C? item = ScreenManagerController.getController();
    assert(item != null, "Controller has not been difined");
    return item!;
  }

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    onInit();

    return const Scaffold();
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