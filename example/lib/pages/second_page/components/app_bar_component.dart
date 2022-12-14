import 'package:compmanager/screen_component.dart';
import 'package:flutter/material.dart';

import '../controller/second_page_controller.dart';
import '../injection/second_page_injection.dart';

// ignore: must_be_immutable
class AppBarComponent extends ScreenComponent<SecondPageController, SecondPageInjection> {
  AppBarComponent({Key? key, required BuildContext context}) : super(key: key, context: context);

  late String title;

  @override
  void onInit() {
    super.onInit();
    if ((ModalRoute.of(controller.context)!.settings.arguments) != null) {
      title = "Update people";
    } else {
      title = "New people";
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      title: Text(title),
    );
  }
}