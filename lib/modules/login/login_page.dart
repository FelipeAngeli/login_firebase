import 'package:flutter/material.dart';

import '../../src/widgets/password_field_widget.dart';
import '../../src/widgets/user_field_widget.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final controller = LoginController(onSucessLogin: () {
    Navigator.of(context).pushReplacementNamed('/home');
  }, onUpDate: () {
    setState(() {});
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
              PasswordFieldWidger(
                label: "Senha",
                validator: controller.validatePassword,
                onSaved: (value) => controller.password = value,
              ),
              const SizedBox(height: 20),
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
                    if (controller.validate()) {
                      controller.login();
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    child: Text(
                      "Entrar",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/register');
                },
                child: const Text(
                  "Crie sua conta",
                  style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 18,
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
