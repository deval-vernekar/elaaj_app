import 'package:elaajapp/utility/dimensions.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  const AppIcon(
      {Key? key,
      required this.icon,
      this.backgroundColor = const Color(0xFF8f837f),
      this.iconColor = const Color(0xFF332d2b),
      this.size = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(size / 2)),
      color: backgroundColor,
      child: Icon(icon, color: iconColor, size: Dimensions.iconSize16),
    );
  }
}
