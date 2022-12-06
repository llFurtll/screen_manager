import 'package:flutter/material.dart';

abstract class ScreenController {
  @protected
  @mustCallSuper
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }
  
  void onReady() {}
  void onClose() {}
}