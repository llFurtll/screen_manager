import 'package:compmanager/screen_component.dart';
import 'package:flutter/material.dart';

import '../controller/first_page_controller.dart';
import '../../../entities/people.dart';

// ignore: must_be_immutable
class ListPeoplesComponent extends ScreenComponent<FirstPageController, ValueListenableBuilder> {
  ListPeoplesComponent({Key? key}) : super(key: key);

  @override
  ValueListenableBuilder<List<People>> build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.peoples,
      builder: (BuildContext context, List<People> value, Widget? widget) {
        if (value.isEmpty) {
          return const Center(child: Text("Nenhuma pessoa cadastrada!"));
        }

        return ListView(
          children: controller.peoples.value.map((people) => _buildCardPeople(people)).toList()
        );
      },
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