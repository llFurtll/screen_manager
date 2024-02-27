import 'package:example/pages/first_page/injection/first_page_injection.dart';
import 'package:screen_manager/extensions.dart';
import 'package:screen_manager/screen_widget.dart';
import 'package:flutter/material.dart';

import '../controller/first_page_controller.dart';

class AppBarWidget extends ScreenWidget<FirstPageController> {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return AppBar(
      centerTitle: true,
      foregroundColor: Colors.black,
      title: ValueListenableBuilder(
        valueListenable: context.get<FirstPageInjection, ValueNotifier<String>>(),
        builder: (_, value, __) {
          return Text(value);
        },
      ),
    );
  }
}