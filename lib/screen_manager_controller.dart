import 'dart:collection';
import 'dart:developer';

import 'screen_controller.dart';

class ScreenManagerController {

  static final HashMap<String, dynamic> _dependencies = HashMap();

  static final ScreenManagerController _instance = ScreenManagerController();

  factory ScreenManagerController() => _instance;

  static void registerController<T extends ScreenController>(T controller) {
    bool exist = false;
    for (var item in _dependencies.values) {
      if (item.runtimeType == controller.runtimeType) {
        exist = true;
      }
    }

    if (!exist) {
      log("[SCREEN_MANAGER]: Creating instance ${controller.runtimeType}");
      _dependencies["${controller.hashCode}"] = controller;
    }
  }

  static T? getController<T extends ScreenController>() {
    return _dependencies.values.firstWhere((element) => element is T, orElse: () => null);
  }

  static void removeController<T extends ScreenController>(T controller) {
    log("[SCREEN_MANAGER]: Deleting instance ${controller.runtimeType}");
    _dependencies.removeWhere((key, value) => value.runtimeType == controller.runtimeType);
  }
}