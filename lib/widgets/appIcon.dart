// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:virtual_lab/presentation/dimenssion.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  const AppIcon({
    super.key,
    required this.icon,
    this.backgroundColor = const Color.fromARGB(255, 255, 219, 195),
    this.iconColor = const Color.fromARGB(255, 133, 95, 42),
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        size: Dimenssion.height20,
        color: iconColor,
      ),
    );
  }
}
