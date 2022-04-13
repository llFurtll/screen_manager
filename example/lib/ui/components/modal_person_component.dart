import 'package:flutter/material.dart';

import 'package:flutterx/domain/interfaces/icomponent.dart';
import 'package:flutterx/infra/implementations/any_screen.dart';
import 'package:flutterx_example/domain/implementations/entities/person.dart';

class ModalPersonComponent<T extends State> implements IComponent<AnyScreen, void, Future<bool>> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();

  final T _screen;
  Person _person = Person(age: "", name: "");

  ModalPersonComponent(this._screen, [Person? _person]) {
    if (_person != null) {
      this._person = _person;
    }
    init();
  }

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
      context: _screen.context,
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
                        Navigator.of(_screen.context).pop();
                      },
                      child: const Text("To go out"),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(_screen.context).pop(true);
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

  @override
  void constructor() {
    return;
  }

  @override
  Future<bool> event() async {
    return false;
  }

  @override
  void init() {
    if (_person.age.isNotEmpty && _person.name.isNotEmpty) {
      _name.text = _person.name;
      _age.text = _person.age;
    }
    return;
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

              return null;
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

              return null;
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

  Person createPerson() {
    Person _newPerson = Person(name: _name.text, age: _age.text);
    return _newPerson;
  }
  
  Person updatePerson() {
    _person.name = _name.text;
    _person.age = _age.text;
    return _person;
  }
}