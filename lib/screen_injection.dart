import 'package:compmanager/screen_view.dart';
import 'package:flutter/material.dart';

abstract class ScreenInjection extends InheritedWidget {
  const ScreenInjection({Key? key, required ScreenView child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget);
}