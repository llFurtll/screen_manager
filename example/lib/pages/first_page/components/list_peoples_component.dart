import 'package:compmanager/screen_component.dart';
import 'package:flutter/material.dart';

import '../controller/first_page_controller.dart';
import '../injection/first_page_injection.dart';
import '../../../entities/people.dart';

// ignore: must_be_immutable
class ListPeoplesComponent extends ScreenComponent<FirstPageController, FirstPageInjection> {
  ListPeoplesComponent({Key? key, required BuildContext context}) : super(key: key, context: context);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: controller.peoples.map((people) => _buildCardPeople(people)).toList()
    );
  }
  
  Widget _buildCardPeople(People people) {
    return InkWell(
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
                    people.nome,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${people.idade}"
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