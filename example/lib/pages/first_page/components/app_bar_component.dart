import 'package:compmanager/screen_component.dart';
import 'package:flutter/material.dart';

import '../controller/first_page_controller.dart';

// ignore: must_be_immutable
class AppBarComponent extends ScreenComponent<FirstPageController, PreferredSize> {
  AppBarComponent({Key? key}) : super(key: key);

  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56.0),
      child: AppBar(
        title: const Text("Peoples"),
      )
    );
  }
}