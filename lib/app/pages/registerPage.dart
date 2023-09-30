import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_lab/data/controller/signUP_controller.dart';
import 'package:virtual_lab/data/models/user_model.dart';
import 'package:virtual_lab/presentation/colorManager.dart';
import 'package:virtual_lab/presentation/dimenssion.dart';
import 'package:virtual_lab/widgets/big_text.dart';
import 'package:virtual_lab/widgets/custom_button.dart';
import 'package:virtual_lab/widgets/text_field.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTab;
  const RegisterPage({super.key, this.onTab});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 340,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/6.jpg"),
                  ),
                ),
              )),
          Positioned(
            left: 0,
            right: 0,
            top: 290,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimenssion.height10,
                right: Dimenssion.height10,
                top: Dimenssion.height30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimenssion.height30),
                    topRight: Radius.circular(Dimenssion.height30)),
                color: ColorManager.background,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimenssion.height20),
                  child: Column(children: [
                    Textfield(
                        controller: controller.firstNameTextController,
                        hintText: "First Name",
                        obscureText: false),
                    SizedBox(
                      height: Dimenssion.height10,
                    ),
                    Textfield(
                        controller: controller.lastNameTextController,
                        hintText: "Last Name",
                        obscureText: false),
                    SizedBox(
                      height: Dimenssion.height10,
                    ),
                    Textfield(
                        controller: controller.emailTextController,
                        hintText: "Email",
                        obscureText: false),
                    SizedBox(
                      height: Dimenssion.height10,
                    ),
                    Textfield(
                        controller: controller.passwordController,
                        hintText: "Password",
                        obscureText: true),
                    SizedBox(
                      height: Dimenssion.height10,
                    ),
                    Textfield(
                        controller: controller.confirmPasswordController,
                        hintText: "Confirm Password",
                        obscureText: true),
                    SizedBox(
                      height: Dimenssion.height10,
                    ),
                    CustomButton(
                        onTab: () {
                          if (controller.confirmPasswordController.text
                                  .trim() ==
                              controller.passwordController.text.trim()) {
                            final user = UserModel(
                                id: FirebaseAuth.instance.currentUser?.uid,
                                password:
                                    controller.passwordController.text.trim(),
                                firstName: controller
                                    .firstNameTextController.text
                                    .trim(),
                                lastName: controller.lastNameTextController.text
                                    .trim(),
                                address: controller.address.text.trim(),
                                phone: controller.phoneNumber.text.trim(),
                                email:
                                    controller.emailTextController.text.trim());

                            SignUpController.instance.addUser(user);
                          } else {
                            Get.snackbar(
                                "Error", "Please Enter Correct Password",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: ColorManager.blueDark,
                                colorText: ColorManager.background);
                          }
                        },
                        text: "Sign Up"),
                    SizedBox(
                      height: Dimenssion.height20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BigText(
                          text: "Already Logged In? ",
                          color: ColorManager.primaryColor,
                        ),
                        SizedBox(
                          width: Dimenssion.height5,
                        ),
                        GestureDetector(
                          onTap: widget.onTab,
                          child: BigText(
                            text: "Login Now",
                            color: ColorManager.amberDark,
                          ),
                        )
                      ],
                    )
                  ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
