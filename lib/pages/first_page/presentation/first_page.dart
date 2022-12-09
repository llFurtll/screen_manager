import 'package:flutter/material.dart';

import '../../../core/screen_view.dart';
import '../components/show_snack_bar.dart';
import '../controller/first_page_controller.dart';
import '../injection/first_page_injection.dart';

class FirstPage extends Screen {
  const FirstPage({Key? key}) : super(key: key);

  @override
  FirstPageInjection build(BuildContext context) {
    return FirstPageInjection(
      child: FirstPageView()
    );
  }
}

// ignore: must_be_immutable
class FirstPageView extends ScreenView<FirstPageController, FirstPageInjection> {
  FirstPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
          title: const Text("First Page"),
        ),
      body: ValueListenableBuilder(
        valueListenable: controller!.isLoading,
        builder: (BuildContext context, bool value, Widget? widget) {
          if (value) {
            return const Center(child: CircularProgressIndicator());
          }

          return Center(
            child: ElevatedButton(
              child: const Text("Go To Second Page"),
              onPressed: () => controller!.showSnackBar(),
            ),
          );
        }
      ),
      floatingActionButton: getComponent(ShowSnackBarComponent)!.constructor(),
    ); 
  }
}