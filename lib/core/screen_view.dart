import 'package:flutter/material.dart';

import 'screen_component.dart';
import 'screen_controller.dart';
import 'screen_injection.dart';

abstract class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  ScreenInjection build(BuildContext context);
}

// ignore: must_be_immutable
abstract class ScreenView<T extends ScreenController, I extends ScreenInjection<T>> extends StatefulWidget {
  T? controller;
  List<ScreenComponent>? _components;

  late final _ScreenViewState _state;

  ScreenView({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    _state = _ScreenViewState();
    return _state;
  }

  void _injection(BuildContext context) {
    controller = ScreenInjection.of<I>(context).controller;
    _components = ScreenInjection.of<I>(context).components;
    if (controller != null) {
      controller!.setState(_state);
      controller!.onInit();
      if (_components != null) {
        for (var component in _components!) {
          component.setController(controller!);
        }
      }
    }
  }

  ScreenComponent? getComponent(Type type) {
    if (_components != null && _components!.isNotEmpty) {
      return _components!.firstWhere((element) => element.runtimeType == type);
    }

    return null;
  }

  @mustCallSuper
  Widget build(BuildContext context) {
    _injection(context);

    return const Scaffold();
  }
}

class _ScreenViewState extends State<ScreenView> {
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