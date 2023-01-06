import 'package:compmanager/screen_widget.dart';
import 'package:flutter/material.dart';

import '../controller/first_page_controller.dart';

class AppBarWidget extends ScreenWidget<FirstPageController> {
  const AppBarWidget({Key? key, required BuildContext context}) : super(key: key, context: context);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return AppBar(
      title: const Text("Peoples"),
    );
  }
}