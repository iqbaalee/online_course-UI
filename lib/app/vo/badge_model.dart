import 'package:flutter/animation.dart';

class BadgeModel {
  int index;
  String title;
  String icon;
  String iconActive;
  bool isActive;
  Color backgroundActive;
  BadgeModel(
      {required this.index,
      required this.title,
      required this.icon,
      required this.iconActive,
      this.isActive = false,
      required this.backgroundActive});
}
