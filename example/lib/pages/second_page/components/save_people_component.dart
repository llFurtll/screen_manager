import 'package:compmanager/screen_component.dart';
import 'package:flutter/material.dart';

import '../controller/second_page_controller.dart';
import '../injection/second_page_injection.dart';

// ignore: must_be_immutable
class SavePeopleComponent extends ScreenComponent<SecondPageController, SecondPageInjection> {
  SavePeopleComponent({Key? key, required BuildContext context}) : super(key: key, context: context);

  @override
  FloatingActionButton build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => controller.save(),
      child: const Icon(Icons.save),
    );
  }
}