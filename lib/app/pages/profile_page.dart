import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:virtual_lab/app/pages/edit_profile.dart';
import 'package:virtual_lab/data/controller/profile_controller.dart';
import 'package:virtual_lab/data/models/user_model.dart';
import 'package:virtual_lab/presentation/colorManager.dart';
import 'package:virtual_lab/presentation/dimenssion.dart';
import 'package:virtual_lab/widgets/big_text.dart';

import '../../widgets/custom_button.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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
          text: "My Profile",
          color: ColorManager.amberDark,
        ),
        backgroundColor: ColorManager.background,
      ),
      backgroundColor: ColorManager.background,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: FutureBuilder(
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
                    Container(
                      height: Dimenssion.height60,
                      width: double.maxFinite,
                      margin: EdgeInsets.only(
                          left: Dimenssion.height20,
                          right: Dimenssion.height20),
                      padding: EdgeInsets.only(
                          left: Dimenssion.height20,
                          right: Dimenssion.height20,
                          top: Dimenssion.height10,
                          bottom: Dimenssion.height10),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimenssion.height10),
                          color: ColorManager.blueDark),
                      child: BigText(
                        text: "First Name : ${userData.firstName}",
                        size: Dimenssion.height20,
                        color: ColorManager.background,
                      ),
                    ),
                    SizedBox(
                      height: Dimenssion.height20,
                    ),
                    Container(
                      height: Dimenssion.height60,
                      width: double.maxFinite,
                      margin: EdgeInsets.only(
                          left: Dimenssion.height20,
                          right: Dimenssion.height20),
                      padding: EdgeInsets.only(
                          left: Dimenssion.height20,
                          right: Dimenssion.height20,
                          top: Dimenssion.height10,
                          bottom: Dimenssion.height10),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimenssion.height10),
                          color: ColorManager.blueDark),
                      child: BigText(
                        text: "Last Name : ${userData.lastName}",
                        size: Dimenssion.height20,
                        color: ColorManager.background,
                      ),
                    ),
                    SizedBox(
                      height: Dimenssion.height20,
                    ),
                    Container(
                      height: Dimenssion.height60,
                      width: double.maxFinite,
                      margin: EdgeInsets.only(
                          left: Dimenssion.height20,
                          right: Dimenssion.height20),
                      padding: EdgeInsets.only(
                          left: Dimenssion.height20,
                          right: Dimenssion.height20,
                          top: Dimenssion.height10,
                          bottom: Dimenssion.height10),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimenssion.height10),
                          color: ColorManager.blueDark),
                      child: BigText(
                        text: "Address : ${userData.address}",
                        size: Dimenssion.height20,
                        color: ColorManager.background,
                      ),
                    ),
                    SizedBox(
                      height: Dimenssion.height20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: Dimenssion.height60,
                      width: double.maxFinite,
                      margin: EdgeInsets.only(
                          left: Dimenssion.height20,
                          right: Dimenssion.height20),
                      padding: EdgeInsets.only(
                          left: Dimenssion.height20,
                          right: Dimenssion.height20,
                          top: Dimenssion.height10,
                          bottom: Dimenssion.height10),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimenssion.height10),
                          color: ColorManager.blueDark),
                      child: BigText(
                        text: "Phone Number : ${userData.phone}",
                        size: Dimenssion.height20,
                        color: ColorManager.background,
                      ),
                    ),
                    SizedBox(
                      height: Dimenssion.height20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: Dimenssion.height60,
                      width: double.maxFinite,
                      margin: EdgeInsets.only(
                          left: Dimenssion.height20,
                          right: Dimenssion.height20),
                      padding: EdgeInsets.only(
                          left: Dimenssion.height20,
                          right: Dimenssion.height20,
                          top: Dimenssion.height10,
                          bottom: Dimenssion.height10),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimenssion.height10),
                          color: ColorManager.blueDark),
                      child: BigText(
                        text: "Email : ${userData.email}",
                        size: Dimenssion.height20,
                        color: ColorManager.background,
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
                          onTab: () => Get.to(() => EditProfile()),
                          text: "Edit Profile"),
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
          future: controller.getUserData(),
        ),
      ),
    );
  }
}
