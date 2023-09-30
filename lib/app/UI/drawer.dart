import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_lab/app/pages/profile_page.dart';
import 'package:virtual_lab/data/repository/auth_repo.dart';
import 'package:virtual_lab/presentation/colorManager.dart';
import 'package:virtual_lab/presentation/dimenssion.dart';
import 'package:virtual_lab/widgets/big_text.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 60, bottom: Dimenssion.height20, left: Dimenssion.height20),
      color: ColorManager.primaryColor,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            CircleAvatar(),
            SizedBox(
              width: 15,
            ),
            Column(
              children: [
                BigText(text: "User Name", fw: FontWeight.w400),
                BigText(
                  text: "Email: ",
                  fw: FontWeight.w600,
                  size: Dimenssion.height15,
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextButton.icon(
                    onPressed: () => Get.to(() => MyProfile()),
                    icon: Icon(
                      Icons.account_box_rounded,
                      color: ColorManager.textColor,
                    ),
                    label: BigText(text: "My Profile", fw: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Dimenssion.height10,
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.history_edu,
                      color: ColorManager.textColor,
                    ),
                    label: BigText(text: "My History", fw: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Dimenssion.height10,
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      color: ColorManager.textColor,
                    ),
                    label: BigText(text: "Setting", fw: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Dimenssion.height10,
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.quiz_sharp,
                      color: ColorManager.textColor,
                    ),
                    label: BigText(text: "My Quiz", fw: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Dimenssion.height10,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      AuthRepository.instance.logOut();
                    },
                    icon: Icon(
                      Icons.logout_sharp,
                      color: ColorManager.textColor,
                    ),
                    label: BigText(text: "LogOut", fw: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.add_alert,
                color: ColorManager.textColor,
              ),
              label: BigText(text: "About Us", fw: FontWeight.w300),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: Dimenssion.height20,
              width: 5,
              color: ColorManager.white,
            ),
            SizedBox(
              width: 10,
            ),
            BigText(text: "Version 1.1", fw: FontWeight.w400)
          ],
        ),
      ]),
    );
  }
}
