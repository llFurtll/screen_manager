import 'package:screen_manager/screen_injection.dart';
import 'package:screen_manager/screen_view.dart';
import 'package:flutter/material.dart';

import '../controller/second_page_controller.dart';


class SecondPageInjection extends ScreenInjection<SecondPageController> {
  SecondPageInjection({
    Key? key,
    required ScreenBridge child
  }) : super(
    key: key,
    child: child,
    controller: SecondPageController()
  );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}