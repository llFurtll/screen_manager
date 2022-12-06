import 'screen_controller.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
abstract class ScreenView<T extends ScreenController> extends StatelessWidget {
  final T Function() creator;
  T? _controller;

  ScreenView({Key? key, required this.creator}) : super(key: key);

  T get controller => _getIntance();

  @override
  Widget build(BuildContext context);

  T _getIntance() {
    if (_controller != null) {
      return _controller!;
    } else {
      _controller = creator();
      return _controller!;
    }
  }
}