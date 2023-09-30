import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_lab/data/models/user_model.dart';
import 'package:virtual_lab/data/repository/auth_repo.dart';
import 'package:virtual_lab/data/repository/user_repo.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final address = TextEditingController();
  final phoneNumber = TextEditingController();

  final _authRepo = Get.put(AuthRepository());
  final _useerRepo = Get.put(UserRepository());

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _useerRepo.getUserDetail(email);
    } else {
      Get.snackbar("Error", "Login to conrinue");
    }
  }

  updateRecord(UserModel user) async {
    await _useerRepo.updateUser(user);
  }
}
