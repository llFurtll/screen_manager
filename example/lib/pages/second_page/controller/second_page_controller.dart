import 'package:compmanager/screen_controller.dart';
import 'package:compmanager/screen_mediator.dart';
import 'package:flutter/material.dart';

import '../../../entities/people.dart';

class SecondPageController extends ScreenController {
  final keyForm = GlobalKey<FormState>();
  final ScreenMediator mediator = ScreenMediator();

  String nome = "";
  int idade = 0;
  String imagem = "";

  late People? people;

  @override
  void onInit() {
    super.onInit();
    
    people = ModalRoute.of(context)!.settings.arguments as People?;

    if (people != null) {
      nome = people!.nome;
      idade = people!.idade;
      imagem = people!.image;
    }

  }

  void save() {
    if (keyForm.currentState!.validate()) {
      keyForm.currentState!.save();

      if (people == null) {
        people = People(
          id: UniqueKey().hashCode,
          nome: nome,
          idade: idade,
          image: imagem
        );

        mediator.callScreen("firstpageview")!.receive("new_people", people);
        Navigator.of(context).pop();
      } else {
        People updatePeople = People(id: people!.id, nome: nome, idade: idade, image: imagem);
        mediator.callScreen("firstpageview")!.receive("update_people", updatePeople);
        Navigator.of(context).pop();
      }
      
    } else {
      _showMessage("Preencha todos os campos!");
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          onPressed: () {},
          label: "",
        ),
      )
    );
  }

  // APPBAR
  String title = "";
}