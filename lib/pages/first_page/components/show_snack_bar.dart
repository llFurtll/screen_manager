import 'package:flutter/material.dart';

import '../../../core/screen_component.dart';
import '../controller/first_page_controller.dart';

class ShowSnackBarComponent extends ScreenComponent<FirstPageController> {
  @override
  Widget constructor() {
    return FloatingActionButton(
      onPressed: () => controller.showSnackBar(),
      child: const Icon(Icons.ads_click),
    );
  }
}