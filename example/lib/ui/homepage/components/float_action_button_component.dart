import 'package:flutter/material.dart';
import 'package:flutterx/domain/interfaces/icomponent.dart';
import 'package:flutterx_example/ui/homepage/homepage.dart';

import 'card_component.dart';

class FloatActionButtonComponent extends IComponent<HomePageState, FloatingActionButton, Future<bool>> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();

  HomePageState screen;
  
  FloatActionButtonComponent(this.screen) : super(screen);

  @override
  Future<bool> afterEvent() async {
    _name.clear();
    _age.clear();
    return false;
  }

  @override
  Future<bool> beforeEvent() async {
    return await showDialog(
      barrierDismissible: false,
      context: screen.context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Enter a name and age",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  )
                ),
                _buildForm(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(screen.context).pop();
                      },
                      child: const Text("To go out"),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                        Navigator.of(screen.context).pop(true);
                        }
                      },
                      child: const Text("Register"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    ) == null ? false : true;
  }

  Form _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Fill in the name";
              }
            },
            controller: _name,
            decoration: const InputDecoration(
              hintText: "Name"
            ),
          ),
          TextFormField(
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Fill in the age";
              }
            },
            controller: _age,
            decoration: const InputDecoration(
              hintText: "Age"
            ),
          ),
        ],
      ),
    );
  }

  @override
  FloatingActionButton constructor() {
    return FloatingActionButton(
      onPressed: () => screen.emitScreen(this),
      child: const Icon(Icons.add),
    );
  }

  @override
  Future<bool> event() async {
    if (await beforeEvent()) {
      screen.getListCards().items.add(
        CardComponent(_name.text, _age.text, screen).constructor()
      );
      afterEvent();
    }

    return false;
  }
}