import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_lab/presentation/dimenssion.dart';

import 'package:virtual_lab/presentation/fontManager.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  final String text;
  TextOverflow overFlow;
  final double size;
  Color color;
  FontWeight fw;

  BigText(
      {super.key,
      this.color = const Color.fromARGB(255, 142, 251, 155),
      required this.text,
      this.overFlow = TextOverflow.ellipsis,
      this.size = 0,
      this.fw = FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // overflow: overFlow,
      style: GoogleFonts.roboto(
          textStyle:
              textStyle(size == 0 ? Dimenssion.height20 : size, color, fw)),
    );
  }
}
