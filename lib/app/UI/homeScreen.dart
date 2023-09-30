import 'package:flutter/material.dart';
import 'package:virtual_lab/app/UI/page_builder.dart';
import 'package:virtual_lab/presentation/colorManager.dart';
import 'package:virtual_lab/presentation/dimenssion.dart';
import 'package:virtual_lab/widgets/big_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffSet = 0;
  double yOffSet = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  void drawerOpen() {
    setState(() {
      xOffSet = 230;
      yOffSet = 150;
      scaleFactor = 0.6;
      isDrawerOpen = true;
    });
  }

  void drawerClose() {
    setState(() {
      xOffSet = 0;
      yOffSet = 0;
      scaleFactor = 1;
      isDrawerOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: AnimatedContainer(
              transform: Matrix4.translationValues(xOffSet, yOffSet, 0)
                ..scale(scaleFactor),
              duration: Duration(milliseconds: 250),
              decoration: BoxDecoration(
                color: ColorManager.background,
                borderRadius: BorderRadius.circular(
                    isDrawerOpen ? Dimenssion.height40 : 0.0),
              ),
              child: Column(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(top: 50, bottom: Dimenssion.height20),
                    padding: EdgeInsets.only(
                        left: Dimenssion.height15, right: Dimenssion.height15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isDrawerOpen
                            ? IconButton(
                                onPressed: drawerClose,
                                icon: Icon(
                                  Icons.arrow_back,
                                  size: Dimenssion.icon24,
                                ))
                            : IconButton(
                                onPressed: drawerOpen,
                                icon:
                                    Icon(Icons.menu, size: Dimenssion.icon24)),
                        Column(
                          children: [
                            BigText(
                              text: "Welcome",
                              color: ColorManager.amberDark,
                            ),
                            Text("User Name"),
                          ],
                        ),
                        Container(
                          height: Dimenssion.height45,
                          width: Dimenssion.height45,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimenssion.height15),
                              color: ColorManager.primaryColor),
                          child: Icon(
                            Icons.search,
                            color: ColorManager.white,
                            size: Dimenssion.icon24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PageBuilder(),
                  SizedBox(
                    height: Dimenssion.height20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: Dimenssion.height30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(
                          text: "Physic Experiments:",
                          color: ColorManager.amberDark,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: BigText(
                              text: "Show All",
                              color: ColorManager.blueDark,
                              size: Dimenssion.height15,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: double.maxFinite,
                    margin: EdgeInsets.only(left: Dimenssion.height30),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: Dimenssion.height20),
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: ColorManager.blueDark),
                                ),
                                Container(
                                  child: BigText(
                                    text: "Experiment",
                                    size: Dimenssion.height10,
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: Dimenssion.height30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(
                          text: "Chemistry Experiments:",
                          color: ColorManager.amberDark,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: BigText(
                              text: "Show All",
                              color: ColorManager.blueDark,
                              size: Dimenssion.height15,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: double.maxFinite,
                    margin: EdgeInsets.only(left: Dimenssion.height30),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                margin:
                                    EdgeInsets.only(right: Dimenssion.height45),
                                decoration:
                                    BoxDecoration(color: ColorManager.blueDark),
                              )
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
