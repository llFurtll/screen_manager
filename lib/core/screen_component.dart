import 'package:compmanager/core/screen_controller.dart';
import 'package:flutter/material.dart';

abstract class ScreenComponent<T extends ScreenController> {
  late T controller;

  Widget constructor();

  void setController(T controller) => this.controller = controller;
}