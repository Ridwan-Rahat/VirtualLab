import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_lab/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:virtual_lab/data/repository/auth_repo.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthRepository()));
  runApp(const MyApp());
}
