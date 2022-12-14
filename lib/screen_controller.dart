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

  void setContext(BuildContext context) => this.context = context;

  void setRefresh(Function refresh) => this.refresh = refresh;
}