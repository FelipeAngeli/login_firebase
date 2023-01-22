import 'package:flutter/material.dart';

import 'modules/home/homepage.dart';
import 'modules/login/login_page.dart';
import 'modules/register_user/register_user_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const LoginPage(),
          '/home': (context) => const HomePage(),
          '/register': (context) => const RegisterUserPage(),
        });
  }
}
