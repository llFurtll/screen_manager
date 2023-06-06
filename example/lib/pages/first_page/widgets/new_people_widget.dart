import 'package:screen_manager/screen_widget.dart';
import 'package:flutter/material.dart';

import '../controller/first_page_controller.dart';

class NewPeopleWidget extends ScreenWidget<FirstPageController> {
  const NewPeopleWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return FloatingActionButton(
      onPressed: () => controller.createPeople(),
      child: const Icon(Icons.add),
    );
  }
}