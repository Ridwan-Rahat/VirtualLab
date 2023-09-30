import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_lab/presentation/colorManager.dart';
import 'package:virtual_lab/presentation/dimenssion.dart';
import 'package:virtual_lab/widgets/appIcon.dart';
import 'package:virtual_lab/widgets/big_text.dart';
import 'package:virtual_lab/widgets/expandable_text.dart';

class ExperimentDetails extends StatefulWidget {
  const ExperimentDetails({super.key});

  @override
  State<ExperimentDetails> createState() => _ExperimentDetailsState();
}

class _ExperimentDetailsState extends State<ExperimentDetails>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimenssion.detailsViewStackHight,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/4.jpg"),
                )),
              )),
          Positioned(
              left: Dimenssion.height20,
              right: Dimenssion.height20,
              top: Dimenssion.height45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () => Get.back(),
                      child: AppIcon(icon: Icons.arrow_back_ios_new)),
                  AppIcon(icon: Icons.favorite)
                ],
              )),
          Positioned(
            top: Dimenssion.detailsViewStackHight - Dimenssion.height20,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                  top: Dimenssion.height20,
                  right: Dimenssion.height20,
                  left: Dimenssion.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimenssion.height20),
                      topLeft: Radius.circular(Dimenssion.height20)),
                  color: ColorManager.background),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: "Experiment no. 1",
                      color: ColorManager.amberDark,
                    ),
                    SizedBox(
                      height: Dimenssion.height20,
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                            labelPadding: EdgeInsets.only(
                                left: Dimenssion.height20,
                                right: Dimenssion.height20),
                            controller: tabController,
                            labelColor: ColorManager.amberDark,
                            unselectedLabelColor: Colors.grey,
                            isScrollable: true,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicator: TabIndicator(
                                color: ColorManager.amberDark, radius: 4),
                            tabs: const [
                              Tab(
                                text: "Details",
                              ),
                              Tab(
                                text: "Simulation",
                              ),
                              Tab(
                                text: "Quiz",
                              )
                            ]),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 350,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          // Details container
                          Container(
                            height: 300,
                            width: double.maxFinite,
                            margin: EdgeInsets.only(
                                left: Dimenssion.height15,
                                top: Dimenssion.height15,
                                right: Dimenssion.height15),
                            padding: EdgeInsets.only(
                                left: Dimenssion.height20,
                                right: Dimenssion.height20),
                            decoration:
                                BoxDecoration(color: ColorManager.background),
                            child: Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: Dimenssion.height10,
                                    ),
                                    BigText(
                                      text: "Introduction",
                                      color: ColorManager.primaryColor,
                                    ),
                                    SizedBox(
                                      height: Dimenssion.height10,
                                    ),
                                    ExpandableText(text: "text")
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Simulation Section
                          Text("Simulation"),
                          // Quiz Section
                          Text("Quiz Section "),
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class TabIndicator extends Decoration {
  final Color color;
  double radius;
  TabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
