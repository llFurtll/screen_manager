import 'package:flutter/material.dart';

abstract class ScreenController {
  late BuildContext context;
  late Function refresh;

  ScreenController();

  @mustCallSuper
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }
  
  void onReady() {}
  
  void onClose() {}

  void onDependencies() {}
}

class NoController extends ScreenController {}