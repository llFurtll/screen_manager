import 'package:compmanager/screen_component.dart';
import 'package:flutter/material.dart';

import '../controller/second_page_controller.dart';

// ignore: must_be_immutable
class AppBarComponent extends ScreenComponent<SecondPageController> {
  AppBarComponent({Key? key}) : super(key: key);

  late String title;

  @override
  void onInit() {
    super.onInit();
    if (ModalRoute.of(controller.context)!.settings.arguments != null) {
      title = "Update People";
    } else {
      title = "New People";
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return PreferredSize(
      preferredSize: const Size.fromHeight(56.0),
      child: AppBar(
        title: Text(title),
      )
    );
  }
}