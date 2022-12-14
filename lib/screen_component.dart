import 'package:compmanager/screen_injection.dart';
import 'package:flutter/material.dart';

import 'screen_controller.dart';

// ignore: must_be_immutable
abstract class ScreenComponent<T extends ScreenController, I extends ScreenInjection<T>> extends StatefulWidget {
  late T? _controller;

  ScreenComponent({Key? key, required BuildContext context}) : super(key: key) {
    _controller = ScreenInjection.of<I>(context).controller;
  }

  T get controller {
    assert(_controller != null, "Not found controller");
    return _controller!;
  }

  Widget build(BuildContext context);

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