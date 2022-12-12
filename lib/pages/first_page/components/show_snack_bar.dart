import 'package:flutter/material.dart';

import '../../../core/screen_component.dart';
import '../controller/first_page_controller.dart';

// ignore: must_be_immutable
class ShowSnackBarComponent extends ScreenComponent<FirstPageController> {
  ShowSnackBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return FloatingActionButton(
      onPressed: () => controller.showSnackBar(),
      child: const Icon(Icons.ads_click),
    );
  }
}