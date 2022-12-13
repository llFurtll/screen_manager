import 'package:compmanager/screen_view.dart';
import 'package:flutter/material.dart';

import '../injection/second_page_injection.dart';
import '../controller/second_page_controller.dart';
import '../components/app_bar_component.dart';
import '../components/save_people_component.dart';

class SecondPage extends Screen {
  static const secondPageRoute = "/people";

  const SecondPage({Key? key}) : super(key: key);

  @override
  SecondPageInjection build(BuildContext context) {
    return SecondPageInjection(
      child: SecondPageView()
    );
  }
}

// ignore: must_be_immutable
class SecondPageView extends ScreenView<SecondPageController, SecondPageInjection> {
  SecondPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: getComponent(AppBarComponent).build(context) as PreferredSize,
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: _buildForm(),
      ),
      floatingActionButton: getComponent(SavePeopleComponent),
    );
  }

  Form _buildForm() {
    return Form(
      key: controller.keyForm,
      child: Column(
        children: [
          _buildTextFormField(controller.nome, "Name", (value) => controller.nome = value!),
          _spacer(),
          _buildTextFormField("${controller.idade}", "Idade", (value) => controller.idade = int.parse(value!), type: TextInputType.number),
          _spacer(),
          _buildTextFormField(controller.imagem, "Imagem", (value) => controller.imagem = value!),
        ],
      ),
    );
  }

  Widget _buildTextFormField(String initialValue, String labelText, Function(String? value) onSaved, {TextInputType type = TextInputType.name}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))
        )
      ),
      validator: (String? value) {
        return value == null || value.isEmpty ? "Campo obrigatório" : null;
      },
      onSaved: onSaved,
      keyboardType: type,
      initialValue: initialValue,
    );
  }

  Widget _spacer() {
    return const SizedBox(height: 10.0);
  }
}