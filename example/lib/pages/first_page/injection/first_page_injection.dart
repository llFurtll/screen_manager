import 'package:compmanager/screen_receive.dart';
import 'package:compmanager/screen_view.dart';
import 'package:flutter/material.dart';
import 'package:compmanager/screen_injection.dart';

import '../controller/first_page_controller.dart';

class FirstPageInjection extends ScreenInjection<FirstPageController> {
  FirstPageInjection({
    Key? key,
    required ScreenBridge child
  }) : super(
    key: key,
    child: child,
    controller: FirstPageController(),
    receiveArgs: const ScreenReceiveArgs(receive: true, identity: "firstpageview")
  );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}