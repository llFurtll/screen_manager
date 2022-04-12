import 'package:flutter/material.dart';
import 'package:flutterx/core/conversable.dart';
import 'package:flutterx/domain/interfaces/icomponent.dart';
import 'package:flutterx_example/domain/implementations/entities/person.dart';
import 'package:flutterx_example/ui/detailspage/detailspage.dart';

class EditPersonComponent implements IComponent<DetailsPageState, AppBar, Future<bool>> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final Conversable _conversable = Conversable();

  final DetailsPageState _screen;
  // ignore: prefer_final_fields
  Person _person;

  EditPersonComponent(this._screen, this._person);

  @override
  Future<bool> afterEvent() async {
    _name.clear();
    _age.clear();
    return false;
  }

  @override
  Future<bool> beforeEvent() async {
    _name.text = _person.name;
    _age.text = _person.age;

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
  AppBar constructor() {
    return AppBar(
      title: Text(_screen.getPerson().name),
      actions: [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            _screen.emitScreen(this);
          },
        )
      ],
    );
  }

  @override
  Future<bool> event() async {
    if (await beforeEvent()) {
      _person.name = _name.text;
      _person.age = _age.text;
      _conversable.callScreen("homepage")!.receive("update", _person);
    }

    afterEvent();

    return false;
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
}