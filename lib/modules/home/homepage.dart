import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Usuario logado com sucesso!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Image.network("https://http.cat/200"),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/login');
            },
            child: const Text("Voltar para a tela de login"),
          ),
        ],
      ),
    );
  }
}
