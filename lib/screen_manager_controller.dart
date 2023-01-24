import 'dart:developer';

import 'screen_controller.dart';

abstract class ScreenManagerController {
  static final List<dynamic> _dependencies = [];

  static void registerController<T extends ScreenController>(T controller) {
    int exist = _dependencies.indexWhere((value) => value.runtimeType == controller.runtimeType);

    if (exist < 0) {
      log("[SCREEN_MANAGER]: Creating instance ${controller.runtimeType}");
      _dependencies.add(controller);
    }
  }

  static T? getController<T extends ScreenController>() {
    return _dependencies.firstWhere((element) => element is T, orElse: () => null);
  }

  static void removeController<T extends ScreenController>(T controller) {
    log("[SCREEN_MANAGER]: Deleting instance ${controller.runtimeType}");
    _dependencies.removeWhere((value) => value.runtimeType == controller.runtimeType);
  }
}