import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  IconData icon;
  Color backgroundColor;
  double size;
  double iconSize;

  AppIcon({
    required this.icon,
    required this.backgroundColor,
    required this.size,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: iconSize,
      ),
    );
  }
}
