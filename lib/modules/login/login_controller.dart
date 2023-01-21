import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController {
  String? username;
  String? password;

  var _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    onUpDate();
  }

  var _error = "";
  String get error => _error;
  set error(String value) {
    _error = value;
    onUpDate();
  }

  final formKey = GlobalKey<FormState>();
  final VoidCallback onSucessLogin;
  final VoidCallback onUpDate;

  LoginController({
    required this.onSucessLogin,
    required this.onUpDate,
  });

  void login() async {
    try {
      isLoading = true;
      final response = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username!, password: password!);
      isLoading = false;
      if (response.user != null) {
        onSucessLogin();
      }
    } catch (e) {
      isLoading = false;
      error = ("Não foi possível fazer o login");
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
}
