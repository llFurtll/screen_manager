import 'package:screen_manager/screen_widget.dart';
import 'package:flutter/material.dart';

import '../controller/first_page_controller.dart';

class AppBarWidget extends ScreenWidget<FirstPageController> {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return AppBar(
      title: const Text("Peoples"),
    );
  }
}