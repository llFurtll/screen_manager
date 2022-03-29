import 'package:flutter/material.dart';
import 'package:flutterx/domain/interfaces/iscreen.dart';
import 'package:flutterx_example/ui/homepage/components/float_action_button_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> implements IScreen {
  final ValueNotifier _count = ValueNotifier(0);
  final ValueNotifier<List<Widget>> _listaCards = ValueNotifier([]);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _listaCards,
        builder: (context, value, child) => ListView(
          children: _listaCards.value
        ),
      ),
      floatingActionButton: FloatActionButtonComponent(this).constructor(),
    );
  }

  ValueNotifier getCount() {
    return _count;
  }

  ValueNotifier<List<Widget>> getListaCards() {
    return _listaCards;
  }

  @override
  void refreshScreen() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("A lista de Cards foi atualizada"),
    ));
  }
}