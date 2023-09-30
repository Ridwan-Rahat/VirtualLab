import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_lab/data/controller/login_controller.dart';
import 'package:virtual_lab/presentation/colorManager.dart';
import 'package:virtual_lab/presentation/dimenssion.dart';
import 'package:virtual_lab/widgets/big_text.dart';
import 'package:virtual_lab/widgets/custom_button.dart';
import 'package:virtual_lab/widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTab;
  const LoginPage({super.key, this.onTab});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.put(LoginController());

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
                decoration: const BoxDecoration(
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
                left: Dimenssion.height20,
                right: Dimenssion.height20,
                top: Dimenssion.height30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimenssion.height30),
                    topRight: Radius.circular(Dimenssion.height30)),
                color: ColorManager.background,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimenssion.height25),
                child: Column(children: [
                  Textfield(
                      controller: controller.email,
                      hintText: "Email",
                      obscureText: false),
                  SizedBox(
                    height: Dimenssion.height10,
                  ),
                  Textfield(
                      controller: controller.password,
                      hintText: "Password",
                      obscureText: true),
                  SizedBox(
                    height: Dimenssion.height10,
                  ),
                  CustomButton(
                      onTab: () {
                        LoginController.intance.loginUser(
                            controller.email.text.trim(),
                            controller.password.text.trim());
                      },
                      text: "Sign In"),
                  SizedBox(
                    height: Dimenssion.height20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigText(
                        text: "Not a User? ",
                        color: ColorManager.primaryColor,
                      ),
                      SizedBox(
                        width: Dimenssion.height5,
                      ),
                      GestureDetector(
                        onTap: widget.onTab,
                        child: BigText(
                          text: "Register Now",
                          color: ColorManager.amberDark,
                        ),
                      )
                    ],
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
