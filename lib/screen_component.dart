import 'package:flutter/material.dart';

import 'screen_controller.dart';

// ignore: must_be_immutable
abstract class ScreenComponent<T extends ScreenController> extends StatefulWidget {
  late T controller;

  ScreenComponent({Key? key}) : super(key: key);

  @mustCallSuper
  Widget build(BuildContext context) {
    onInit();

    return const Scaffold();
  }

  void setController(T controller) => this.controller = controller;

  @mustCallSuper
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  @mustCallSuper
  void onReady() {}

  @mustCallSuper
  void onClose() {}

  @override
  _ScreenComponentState createState() => _ScreenComponentState();
}

class _ScreenComponentState extends State<ScreenComponent> {
  @override
  void dispose() {
    widget.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context);
  }
}