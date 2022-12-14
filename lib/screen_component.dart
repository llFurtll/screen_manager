import 'package:flutter/material.dart';

import 'screen_controller.dart';

// ignore: must_be_immutable
abstract class ScreenComponent<T extends ScreenController, W> extends StatefulWidget {
  late T controller;

  ScreenComponent({Key? key}) : super(key: key);

  W build(BuildContext context);

  void setController(T controller) => this.controller = controller;

  @mustCallSuper
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {}

  void onClose() {}

  @override
  _ScreenComponentState createState() => _ScreenComponentState();
}

class _ScreenComponentState extends State<ScreenComponent> {
  @override
  void initState() {
    super.initState();
    widget.onInit();
  }

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