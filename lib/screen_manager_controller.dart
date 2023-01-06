import 'dart:collection';

import 'screen_controller.dart';

class ScreenManagerController {

  static final HashMap<String, dynamic> _dependencies = HashMap();

  static final ScreenManagerController _instance = ScreenManagerController();

  factory ScreenManagerController() => _instance;

  static void registerDependencie<T extends ScreenController>(T value) {
    bool exist = false;
    for (var item in _dependencies.values) {
      if (item.runtimeType == value.runtimeType) {
        exist = true;
      }
    }

    if (!exist) {
      _dependencies["${value.hashCode}"] = value;
    }
  }

  static T? getDependencie<T extends ScreenController>() {
    return _dependencies.values.firstWhere((element) => element is T, orElse: () => null);
  }
}