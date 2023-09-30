import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_lab/data/models/user_model.dart';
import 'package:virtual_lab/data/repository/auth_repo.dart';
import 'package:virtual_lab/data/repository/user_repo.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final userRepo = Get.put(UserRepository());

  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final address = TextEditingController();
  final phoneNumber = TextEditingController();

  Future<void> addUser(UserModel user) async {
    await userRepo.addUser(user);
    resisterUser(user.email, user.password);
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.creatUser(user);
    resisterUser(user.email, user.password);
  }

  void resisterUser(String email, String password) {
    AuthRepository.instance.createUserWithEmailandPassword(email, password);
  }
}
