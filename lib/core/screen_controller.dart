import 'package:flutter/material.dart';

abstract class ScreenController {
  late BuildContext context;

  ScreenController();

  @mustCallSuper
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }
  
  @mustCallSuper
  void onReady() {}
  
  @mustCallSuper
  void onClose() {}

  void setContext(BuildContext context) => this.context = context;
}