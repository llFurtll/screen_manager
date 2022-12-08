import 'package:compmanager/core/screen_component.dart';
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
  List<ScreenComponent>? _components;

  ScreenView({Key? key}) : super(key: key);

  @override
  _ScreenViewState createState() => _ScreenViewState<I>();

  Widget build(BuildContext context);

  T? get controller => _controller;

  List<ScreenComponent>? get components => _components;
}

class _ScreenViewState<I extends ScreenInjection> extends State<ScreenView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget._controller = ScreenInjection.of<I>(context).controller;
      widget._components = ScreenInjection.of<I>(context).components;
      if (widget._controller != null) {
        widget.controller!.setState(this);
        widget._controller!.onInit();
        if (widget._components != null && widget._components!.isNotEmpty) {
          for (var component in widget.components!) {
            component.setController(widget._controller!);
          }
        }
      }
    });
  }

  @override
  void dispose() {
    if (widget.controller != null) {
      widget.controller!.onClose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context);
  }
}