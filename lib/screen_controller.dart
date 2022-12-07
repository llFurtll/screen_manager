import 'package:flutter/material.dart';

abstract class ScreenController {
  late State state;

  ScreenController();

  @mustCallSuper
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }
  
  @mustCallSuper
  void onReady() {}
  
  @mustCallSuper
  void onClose() {}

  void setState(State state) => this.state = state;
}