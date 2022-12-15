import 'package:flutter/material.dart';

import 'screen_controller.dart';
import 'screen_injection.dart';

// ignore: must_be_immutable
abstract class ScreenComponent<T extends ScreenController, I extends ScreenInjection<T>> extends StatefulWidget {
  late T? _controller;
  late Function refresh;

  ScreenComponent({Key? key, required BuildContext context}) : super(key: key) {
    _controller = ScreenInjection.of<I>(context).controller;
  }

  T get controller {
    assert(_controller != null, "Controller has not been defined");
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
    widget.refresh = () => setState(() {});
    
    return widget.build(context);
  }
}