import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_lab/presentation/colorManager.dart';
import 'package:virtual_lab/presentation/dimenssion.dart';
// import 'package:virtual_lab/presentation/colorManager.dart';
import 'package:virtual_lab/widgets/big_text.dart';

import '../pages/details_page.dart';

class PageBuilder extends StatefulWidget {
  const PageBuilder({super.key});

  @override
  State<PageBuilder> createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _curPageValue = 0.0;
  final double _scaleFactor = 0.7;
  final double _height = Dimenssion.pageViewContainerHight;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _curPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimenssion.pageViewMainContainerHight,
          child: GestureDetector(
            onTap: () => Get.to(() => ExperimentDetails()),
            child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                itemBuilder: ((context, index) {
                  return _pageBuilder(index);
                })),
          ),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _curPageValue.toInt(),
          decorator: DotsDecorator(
            activeColor: ColorManager.amberDark,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }

  Widget _pageBuilder(int index) {
    Matrix4 martix = Matrix4.identity();
    if (index == _curPageValue.floor()) {
      var currentScale = 1 - (_curPageValue - index) * (1 - _scaleFactor);
      var currentHeight = _height * (1 - currentScale) / 2;
      martix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentHeight, 0);
    } else if (index == _curPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_curPageValue - index + 1) * (1 - _scaleFactor);
      var currentHeight = _height * (1 - currentScale) / 2;
      martix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentHeight, 0);
    } else if (index == _curPageValue.floor() - 1) {
      var currentScale = 1 - (_curPageValue - index) * (1 - _scaleFactor);

      var currentHeight = _height * (1 - currentScale) / 2;
      martix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentHeight, 0);
    } else {
      var currentScale = 0.7;

      var currentHeight = _height * (1 - currentScale) / 2;
      martix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentHeight, 0);
    }
    return Transform(
      transform: martix,
      child: Stack(
        children: [
          Container(
            height: Dimenssion.pageViewContainerHight,
            margin: EdgeInsets.only(
                left: Dimenssion.height5, right: Dimenssion.height5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimenssion.height30),
              color: Colors.blue,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/2.jpg"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimenssion.pageViewTextContainerHight,
              margin: EdgeInsets.only(
                  left: Dimenssion.height30,
                  right: Dimenssion.height30,
                  bottom: Dimenssion.height10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimenssion.height30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    offset: const Offset(0, 5),
                    blurRadius: 5.0,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  )
                ],
                // color: ColorManager.white,
              ),
              child: Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimenssion.height15,
                      left: Dimenssion.height15,
                      right: Dimenssion.height15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: "Pendulam Experiment", fw: FontWeight.bold),
                      SizedBox(
                        height: Dimenssion.height10,
                      ),
                      BigText(text: "Short Intro :", fw: FontWeight.w600),
                      SizedBox(
                        height: Dimenssion.height10,
                      ),
                      BigText(text: "Details........", fw: FontWeight.w500),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
