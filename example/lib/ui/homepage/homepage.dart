import 'package:flutter/material.dart';
import 'package:flutterx_example/ui/homepage/components/floating_action_button_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final ValueNotifier _count = ValueNotifier(0);
  late FloatingActionButtonComponent floatingActionButtonComponent;

  @override
  void initState() {
    floatingActionButtonComponent = FloatingActionButtonComponent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: _count,
          builder: (BuildContext context, value, Widget? child) {
            return Text("${_count.value}");
          },
        ),
      ),
      floatingActionButton: floatingActionButtonComponent.constructor(),
    );
  }

  ValueNotifier getCount() {
    return _count;
  }
}