import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      }));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Usuario logado com sucesso!",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? username;
  String? password;
  var isLoading = false;

  final formKey = GlobalKey<FormState>();

  void login({
    required String username,
    required String password,
  }) async {
    isLoading = true;
    setState(() {});

    final response = await apiLogin(username: username, password: password);
    isLoading = false;
    setState(() {});
    if (response) {
      Navigator.pushNamed(context, '/home');
    } else {
      print("Erro ao logar");
    }
  }

  bool validate() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  String? validateUsername(String? username) =>
      username != null && username.isNotEmpty ? null : "Campo obrigatório";

  String? validatePassword(String? password) =>
      password != null && password.length >= 6
          ? null
          : "A senha precisa ter no mínimo 6 caracteres";

  Future<bool> apiLogin({
    required String username,
    required String password,
  }) async {
    final response = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: username, password: password);
    print(response);
    // await Future.delayed(Duration(seconds: 3));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Usuário",
                border: OutlineInputBorder(),
              ),
              validator: validateUsername,
              onSaved: (value) => username = value,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Senha",
                border: OutlineInputBorder(),
              ),
              validator: validatePassword,
              onSaved: (value) => password = value,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (validate()) {
                  login(username: username!, password: password!);
                }
              },
              child: Text("Entrar"),
            ),
            if (isLoading) CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
