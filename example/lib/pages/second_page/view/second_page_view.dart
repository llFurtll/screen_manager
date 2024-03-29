import 'package:screen_manager/screen_view.dart';
import 'package:flutter/material.dart';

import '../injection/second_page_injection.dart';
import '../controller/second_page_controller.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/save_people_widget.dart';

class SecondPage extends Screen {
  static const secondPageRoute = "/people";

  const SecondPage({Key? key}) : super(key: key);

  @override
  SecondPageInjection build(BuildContext context) {
    return SecondPageInjection(
      child: const ScreenBridge<SecondPageController, SecondPageInjection>(
        child: SecondPageView(),
      )
    );
  }
}

class SecondPageView extends ScreenView<SecondPageController> {
  const SecondPageView({Key? key}) : super(key: key);

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: AppBarWidget(),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: _buildForm(),
      ),
      floatingActionButton: const SavePeopleWidget(),
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