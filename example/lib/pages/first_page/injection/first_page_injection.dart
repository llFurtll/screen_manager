import 'package:screen_manager/screen_receive.dart';
import 'package:screen_manager/screen_view.dart';
import 'package:flutter/material.dart';
import 'package:screen_manager/screen_injection.dart';

import '../controller/first_page_controller.dart';

class FirstPageInjection extends ScreenInjection<FirstPageController> {
  FirstPageInjection({
    Key? key,
    required ScreenBridge child,
    BuildContext? context
  }) : super(
    key: key,
    child: child,
    controller: FirstPageController(),
    receiveArgs: const ScreenReceiveArgs(receive: true, identity: "firstpageview"),
    context: context
  );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}