import 'package:flutter/material.dart';
import 'package:compmanager/screen_injection.dart';

import '../controller/first_page_controller.dart';

// ignore: must_be_immutable
class FirstPageInjection extends ScreenInjection<FirstPageController> {
  FirstPageInjection({
    Key? key,
    required Builder child
  }) : super(
    key: key,
    child: child,
    controller: FirstPageController()
  );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}