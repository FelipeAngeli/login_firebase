import 'package:flutter/material.dart';

import '../../src/widgets/user_field_widget.dart';
import 'register_user_controller.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  late final controller = RegisterUserController(onSucessLogin: () {
    Navigator.of(context).pushReplacementNamed('/home');
  }, onUpDate: () {
    setState(() {});
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Cadastro de usuário"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/login');
            },
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserFieldWidget(
                label: "Usuário",
                icon: Icons.person,
                validator: controller.validateUsername,
                onSaved: (value) => controller.username = value,
              ),
              const SizedBox(height: 20),
              UserFieldWidget(
                label: "Senha",
                icon: Icons.lock,
                validator: controller.validatePassword,
                onSaved: (value) => controller.password = value,
              ),
              const SizedBox(height: 20),
              UserFieldWidget(
                label: "Confirmar senha",
                icon: Icons.lock,
                validator: controller.validatePassword,
                onSaved: (value) => controller.password = value,
              ),
              const SizedBox(height: 40),
              if (controller.isLoading)
                const CircularProgressIndicator()
              else if (controller.error.isNotEmpty)
                Text(
                  controller.error,
                  style: const TextStyle(color: Colors.red),
                )
              else
                ElevatedButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.formKey.currentState!.save();
                      controller.register();
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    child: Text(
                      "Cadastrar",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
