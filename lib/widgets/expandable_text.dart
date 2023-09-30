import 'package:flutter/material.dart';
import 'package:virtual_lab/presentation/colorManager.dart';
import 'package:virtual_lab/presentation/dimenssion.dart';
import 'package:virtual_lab/widgets/big_text.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondhalf;

  bool isHidden = true;
  double textHeight = Dimenssion.screenHeight / 5.63;
  @override
  void initState() {
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondhalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondhalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondhalf.isEmpty
          ? BigText(
              text: firstHalf,
              size: Dimenssion.height15,
              color: ColorManager.amberDark,
            )
          : Column(children: [
              BigText(
                text:
                    isHidden ? ("$firstHalf.......") : (firstHalf + secondhalf),
                size: Dimenssion.height15,
                color: ColorManager.amberDark,
                
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
                child: Row(
                  children: [
                    BigText(
                      text: "Show More",
                      size: Dimenssion.height15,
                      color: ColorManager.blueDark,
                    ),
                    Icon(
                      isHidden ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                      color: ColorManager.blueDark,
                    ),
                  ],
                ),
              )
            ]),
    );
  }
}
