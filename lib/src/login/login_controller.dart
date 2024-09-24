import 'package:flutter/material.dart';

class LoginController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goToRegisterPage(BuildContext context) {
    Navigator.of(context).pushNamed('register');
  }

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
  }
}
