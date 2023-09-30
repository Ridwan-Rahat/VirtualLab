import 'package:flutter/material.dart';
import 'package:virtual_lab/app/pages/loginPage.dart';
import 'package:virtual_lab/app/pages/registerPage.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLogin = true;
  void switchPage() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginPage(
        onTab: switchPage,
      );
    } else {
      return RegisterPage(
        onTab: switchPage,
      );
    }
  }
}
