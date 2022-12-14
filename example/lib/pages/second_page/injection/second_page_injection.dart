import 'package:compmanager/screen_injection.dart';
import 'package:flutter/material.dart';

import '../controller/second_page_controller.dart';

// ignore: must_be_immutable
class SecondPageInjection extends ScreenInjection<SecondPageController> {
  SecondPageInjection({
    Key? key,
    required Builder child
  }) : super(
    key: key,
    child: child,
    controller: SecondPageController()
  );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}