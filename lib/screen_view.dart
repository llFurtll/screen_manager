import 'package:flutter/material.dart';

import 'screen_controller.dart';
import 'screen_injection.dart';

// ignore: must_be_immutable
abstract class ScreenView<T extends ScreenController> extends StatefulWidget {
  final T Function() creator;
  T? _controller;
  
  final _ScreenViewState _state = _ScreenViewState();

  ScreenView({Key? key, required this.creator}) : super(key: key) {
    _getIntance();
  }

  T get controller => _getIntance();

  ScreenInjection build(BuildContext context);

  T _getIntance() {
    if (_controller != null) {
      return _controller!;
    } else {
      _controller = creator();
      _controller!.setState(_state);
      return _controller!;
    }
  }
  
  @override
  // ignore: no_logic_in_create_state
  _ScreenViewState createState() => _state;
}

class _ScreenViewState extends State<ScreenView> {
  @override
  void initState() {
    super.initState();
    widget.controller.onInit();
  }

  @override
  void dispose() {
    widget.controller.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context);
  }
}