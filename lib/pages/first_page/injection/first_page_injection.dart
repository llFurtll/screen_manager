import 'package:flutter/material.dart';

import '../../../core/screen_injection.dart';
import '../../../core/screen_view.dart';
import '../controller/first_page_controller.dart';

// ignore: must_be_immutable
class FirstPageInjection extends ScreenInjection<FirstPageController> {
  FirstPageInjection({
    Key? key, required ScreenView child
    }) : super(
      key: key,
      child: child
    );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}