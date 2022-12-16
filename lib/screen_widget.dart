import 'package:flutter/material.dart';

import 'screen_controller.dart';
import 'screen_injection.dart';

// ignore: must_be_immutable
abstract class ScreenWidget<T extends ScreenController, I extends ScreenInjection<T>> extends StatefulWidget {
  late T? _controller;
  late Function refresh;
  late BuildContext context;

  ScreenWidget({Key? key, required BuildContext context}) : super(key: key) {
    if (T is! NoController) {
      _controller = ScreenInjection.of<I>(context).controller;
    }
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
  _ScreenWidgetState createState() => _ScreenWidgetState();
}

class _ScreenWidgetState extends State<ScreenWidget> {
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
    widget.context = context;
    
    return widget.build(context);
  }
}