import 'package:flutter/material.dart';

import 'screen_controller.dart';
import 'screen_injection.dart';
import 'screen_mediator.dart';
import 'screen_receive.dart';

abstract class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  ScreenInjection build(BuildContext context);
}

// ignore: must_be_immutable
abstract class ScreenView<T extends ScreenController, I extends ScreenInjection<T>> extends StatefulWidget {
  T? _controller;
  late ScreenReceiveArgs _receiveArgs;

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
    if (T is! NoController) {
      _controller = ScreenInjection.of<I>(context).controller;
      _receiveArgs = ScreenInjection.of<I>(context).receiveArgs;
      if (_controller != null) {
        _controller!.context = context;
      }
    }
  }

  @mustCallSuper
  Scaffold build(BuildContext context);

  void receive(String message, dynamic value, {ScreenReceive? screen}) {
    return;
  }
}

class _ScreenViewState extends State<ScreenView> with ScreenReceive {
  ScreenMediator mediator = ScreenMediator();

  @override
  void initState() {
    super.initState();
    if (widget._controller != null) {
      widget._controller!.onInit();
    }
    if (widget._receiveArgs.receive) {
      mediator.addScreen(widget._receiveArgs.identity, this);
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
      widget._controller!.refresh = () => setState(() {});
    }
    
    if (widget._controller != null) {
      widget._controller!.context = context;
    }

    return widget.build(context);
  }

  @override
  void receive(String message, dynamic value, {ScreenReceive? screen}) {
    widget.receive(message, value, screen: screen);
  }
}