import 'package:screen_manager/screen_widget.dart';
import 'package:flutter/material.dart';

import '../controller/first_page_controller.dart';
import '../../../entities/people.dart';

class ListPeoplesComponent extends ScreenWidget<FirstPageController> {
  const ListPeoplesComponent({Key? key, BuildContext? context}) : super(key: key, context: context);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Builder(
      builder: (context) {
        if (controller.peoples.isEmpty) {
          return const Center(child: Text("Nenhuma pessoa cadastrada!"));
        }

        return ListView(
          children: controller.peoples.map((people) => _buildCardPeople(people)).toList()
        );
      }
    );
  }
  
  Widget _buildCardPeople(People people) {
    return InkWell(
      onDoubleTap: () => controller.deletePeople(people),
      onTap: () => controller.updatePeople(people),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Wrap(
            spacing: 10.0,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(people.image),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nome: ${people.nome}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Idade: ${people.idade}"
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}