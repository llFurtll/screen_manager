import 'package:flutter/material.dart';

import '../../../core/screen_controller.dart';

class FirstPageController extends ScreenController {
  ValueNotifier<bool> isLoading = ValueNotifier(true);

  void showSnackBar() {
    ScaffoldMessenger.of(state.context).showSnackBar(const SnackBar(content: Text("Está funcionando")));
  }

  @override
  void onReady() {
    super.onReady();
    isLoading.value = false;
  }
}