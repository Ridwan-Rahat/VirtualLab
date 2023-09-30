import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_lab/data/repository/auth_repo.dart';

class LoginController extends GetxController {
  static LoginController get intance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> loginUser(String email, String password) async {
    await AuthRepository.instance
        .loginUserWithEmailandPassword(email, password);
  }
}
