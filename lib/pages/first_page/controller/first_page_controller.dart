import 'package:flutter/material.dart';

import '../../../core/screen_controller.dart';

class FirstPageController extends ScreenController {
  void showSnackBar() {
    ScaffoldMessenger.of(state.context).showSnackBar(const SnackBar(content: Text("Está funcionando")));
  }
}