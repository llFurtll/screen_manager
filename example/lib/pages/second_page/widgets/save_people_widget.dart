import 'package:compmanager/screen_widget.dart';
import 'package:flutter/material.dart';

import '../controller/second_page_controller.dart';


class SavePeopleWidget extends ScreenWidget<SecondPageController> {
  const SavePeopleWidget({Key? key, required BuildContext context}) : super(key: key, context: context);

  @override
  FloatingActionButton build(BuildContext context) {
    super.build(context);

    return FloatingActionButton(
      onPressed: () => controller.save(),
      child: const Icon(Icons.save),
    );
  }
}