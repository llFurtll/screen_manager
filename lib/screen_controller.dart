import 'dart:developer';

import 'package:flutter/material.dart';

import 'screen_manager_controller.dart';
import 'screen_receive.dart';

abstract class ScreenController {
  late BuildContext context;
  late Function refresh;
  late ScreenReceiveArgs receiveArgs;

  ScreenController();

  @mustCallSuper
  void onInit() {
    log("[SCREEN_MANAGER]: Running onInit $runtimeType");
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }
  
  @mustCallSuper
  void onReady() {
    log("[SCREEN_MANAGER]: Running onReady $runtimeType");
  }
  
  @mustCallSuper
  void onClose() {
    ScreenManagerController.removeController(this);
    log("[SCREEN_MANAGER]: Running onClose $runtimeType");
  }

  @mustCallSuper
  void onDependencies() {
    log("[SCREEN_MANAGER]: Running onDependencies $runtimeType");
  }
}