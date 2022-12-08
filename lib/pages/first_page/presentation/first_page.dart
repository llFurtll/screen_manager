import '../../../core/screen_view.dart';
import '../controller/first_page_controller.dart';
import '../injection/first_page_injection.dart';
import 'package:flutter/material.dart';

class FirstPage extends Screen {
  const FirstPage({Key? key}) : super(key: key);

  @override
  FirstPageInjection build(BuildContext context) {
    print("ZDASJDHASJKDHASDJKAHSK");
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
    print("ASDJHADJKAHSDJKLASHDJKASHDJKLAS");
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go To Second Page"),
          onPressed: () => controller!.showSnackBar(),
        ),
      ),
    );
  }
}