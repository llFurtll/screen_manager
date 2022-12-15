import 'package:flutter/material.dart';

import 'screen_controller.dart';
import 'screen_injection.dart';

abstract class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  ScreenInjection build(BuildContext context);
}

// ignore: must_be_immutable
abstract class ScreenView<T extends ScreenController, I extends ScreenInjection<T>> extends StatefulWidget {
  T? _controller;

  ScreenView({Key? key, required BuildContext context}) : super(key: key) {
    _injection(context);
  }

  T get controller {
    assert(_controller != null, "Controller has not been defined");
    return _controller!;
  }

  @override
  State<StatefulWidget> createState() => _ScreenViewState();

  void _injection(BuildContext context) {
    _controller = ScreenInjection.of<I>(context).controller;
    if (_controller != null) {
      _controller!.context = context;
    }
  }

  @mustCallSuper
  Scaffold build(BuildContext context);
}

class _ScreenViewState extends State<ScreenView> {
  @override
  void initState() {
    super.initState();
    if (widget._controller != null) {
      widget._controller!.onInit();
      widget._controller!.refresh = () => setState(() {});
    }
  }

  @override
  void dispose() {
    if (widget._controller != null) {
      widget._controller!.onClose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget._controller != null) {
      widget._controller!.context = context;
    }

    return widget.build(context);
  }
}