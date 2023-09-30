import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:virtual_lab/data/controller/profile_controller.dart';

import 'package:virtual_lab/data/models/user_model.dart';
import 'package:virtual_lab/presentation/colorManager.dart';
import 'package:virtual_lab/presentation/dimenssion.dart';
import 'package:virtual_lab/widgets/big_text.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/text_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  final user = FirebaseAuth.instance.currentUser;
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: ColorManager.amberDark,
            )),
        title: BigText(
          text: "Edit Profile",
          color: ColorManager.amberDark,
        ),
        backgroundColor: ColorManager.background,
      ),
      backgroundColor: ColorManager.background,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(
              left: Dimenssion.height20, right: Dimenssion.height20),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;
                  return Column(
                    children: [
                      SizedBox(
                        height: Dimenssion.height10,
                      ),
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: Stack(fit: StackFit.expand, children: [
                          CircleAvatar(),
                          Positioned(
                              bottom: 0,
                              right: 5,
                              child: Container(
                                height: Dimenssion.height45,
                                width: Dimenssion.height45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimenssion.height25),
                                    color: ColorManager.amberDark),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.camera_alt,
                                      color: ColorManager.background,
                                    )),
                              ))
                        ]),
                      ),
                      SizedBox(
                        height: Dimenssion.height20,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: SizedBox(
                            child: Column(
                              children: [
                                Textfield(
                                    controller:
                                        controller.firstNameTextController,
                                    hintText: "First Name",
                                    obscureText: false),
                                SizedBox(
                                  height: Dimenssion.height20,
                                ),
                                Textfield(
                                    controller:
                                        controller.lastNameTextController,
                                    hintText: "Last Name",
                                    obscureText: false),
                                SizedBox(
                                  height: Dimenssion.height20,
                                ),
                                Textfield(
                                    controller: controller.address,
                                    hintText: "Address",
                                    obscureText: false),
                                SizedBox(
                                  height: Dimenssion.height20,
                                ),
                                Textfield(
                                    controller: controller.phoneNumber,
                                    hintText: "Phone Number",
                                    obscureText: false),
                                SizedBox(
                                  height: Dimenssion.height20,
                                ),
                                Textfield(
                                    controller: controller.emailTextController,
                                    hintText: "Email",
                                    obscureText: false),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimenssion.height20,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: Dimenssion.height80,
                        width: double.maxFinite,
                        margin: EdgeInsets.only(
                            left: Dimenssion.height20,
                            right: Dimenssion.height20),
                        child: CustomButton(
                            onTab: () async {
                              final userdata = UserModel(
                                id: user?.uid,
                                address: controller.address.text.trim(),
                                email:
                                    controller.emailTextController.text.trim(),
                                password:
                                    controller.passwordController.text.trim(),
                                firstName: controller
                                    .firstNameTextController.text
                                    .trim(),
                                lastName: controller.lastNameTextController.text
                                    .trim(),
                                phone: controller.phoneNumber.text.trim(),
                              );
                              await controller.updateRecord(userdata);
                            },
                            text: "Update Profile"),
                      ),
                      SizedBox(
                        height: Dimenssion.height20,
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return Center(
                    child: Text("Something went wrong"),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
