import 'package:compmanager/screen_widget.dart';
import 'package:flutter/material.dart';

import '../controller/first_page_controller.dart';
import '../injection/first_page_injection.dart';

// ignore: must_be_immutable
class AppBarComponent extends ScreenWidget<FirstPageController, FirstPageInjection> {
  AppBarComponent({Key? key, required BuildContext context}) : super(key: key, context: context);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Peoples"),
    );
  }
}