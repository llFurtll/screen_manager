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
  final _ScreenViewState _state = _ScreenViewState<T, I>();
  T? _controller;

  ScreenView({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _ScreenViewState createState() => _state;

  Widget build(BuildContext context);

  T? get controller => _controller;
}

class _ScreenViewState<T extends ScreenController, I extends ScreenInjection<T>> extends State<ScreenView> {
  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller!.onInit();
    }
  }

  @override
  void dispose() {
    if (widget.controller != null) {
      widget.controller!.onClose();
    }
    super.dispose();
  }

  @override
  void didChangeDependencies() {
      widget._controller = ScreenInjection.of<I>(context).controller;
      if (widget._controller != null) {
        widget.controller!.setState(this);
      }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context);
  }
}