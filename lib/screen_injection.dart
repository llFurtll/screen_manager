import 'package:flutter/material.dart';

abstract class ScreenInjection extends InheritedWidget {
  const ScreenInjection({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget);
}