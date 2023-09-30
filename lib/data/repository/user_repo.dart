import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:virtual_lab/data/models/user_model.dart';
import 'package:virtual_lab/presentation/colorManager.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> addUser(UserModel user) async {
    await _db.collection("Users").doc(user.id).set(user.toMap());
  }

  Future<UserModel?> getUser(String uid) async {
    final DocumentSnapshot doc = await _db.collection("User").doc(uid).get();
    if (doc.exists) {
      return UserModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    } else {
      return null;
    }
  }

  creatUser(UserModel user) async {
    await _db.collection("Users").add(user.toMap()).whenComplete(() =>
        Get.snackbar("Success", "User Created Successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: ColorManager.blueDark,
            colorText: ColorManager.background));
  }

  Future<UserModel> getUserDetail(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> updateUser(UserModel user) async {
    print(_db.collection("Users").doc(user.id));
    await _db.collection("Users").doc(user.id).update(user.toJson());
  }
}
