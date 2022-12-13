import 'package:compmanager/screen_component.dart';
import 'package:flutter/material.dart';

import '../controller/second_page_controller.dart';

// ignore: must_be_immutable
class SavePeopleComponent extends ScreenComponent<SecondPageController> {
  SavePeopleComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return FloatingActionButton(
      onPressed: () => controller.save(),
      child: const Icon(Icons.save),
    );
  }
}