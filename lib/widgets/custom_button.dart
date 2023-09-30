import 'package:flutter/material.dart';
import 'package:virtual_lab/presentation/colorManager.dart';
import 'package:virtual_lab/widgets/big_text.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTab;
  final String text;
  const CustomButton({super.key, this.onTab, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: ColorManager.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: BigText(text: text)),
      ),
    );
  }
}
