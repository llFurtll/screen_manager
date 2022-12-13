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
  T? _controller;

  late List<ScreenComponent> _components;

  ScreenView({Key? key}) : super(key: key);

  T get controller {
    assert(_controller != null, "Controller has not been defined");
    return _controller!;
  }

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _ScreenViewState();

  void _injection(BuildContext context) {
    _controller = ScreenInjection.of<I>(context).controller;
    _components = ScreenInjection.of<I>(context).components;
    if (_controller != null) {
      _controller!.setContext(context);
      _controller!.onInit();
      for (var component in _components) {
        component.setController(_controller!);
      }
    }
  }

  ScreenComponent getComponent(Type type) {
    assert(_components.isNotEmpty, "No component found");
    return _components.firstWhere((element) => element.runtimeType == type);
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
    if (widget._controller != null) {
      widget._controller!.onClose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context);
  }
}