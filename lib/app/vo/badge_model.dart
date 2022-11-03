import 'package:flutter/material.dart';

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

  static final badge = [
    BadgeModel(
      index: 0,
      title: 'All Topic',
      iconActive: 'assets/images/png/fire.png',
      icon: 'assets/images/png/fire-color.png',
      backgroundActive: Color.fromRGBO(82, 195, 255, 1),
    ),
    BadgeModel(
      index: 1,
      title: 'Newest',
      iconActive: 'assets/images/png/star.png',
      icon: 'assets/images/png/star-color.png',
      backgroundActive: Color.fromRGBO(115, 131, 192, 1),
    ),
    BadgeModel(
      index: 2,
      title: 'Popular',
      iconActive: 'assets/images/png/thunder.png',
      icon: 'assets/images/png/thunder-color.png',
      backgroundActive: Color.fromRGBO(249, 174, 43, 1),
    ),
    BadgeModel(
      index: 3,
      title: 'Advance',
      iconActive: 'assets/images/png/tag.png',
      icon: 'assets/images/png/tag-color.png',
      backgroundActive: Color.fromRGBO(84, 173, 34, 1),
    )
  ];

  static final badgeFilter = [
    BadgeModel(
      index: 0,
      title: 'All Topic',
      iconActive: 'assets/images/png/fire.png',
      icon: 'assets/images/png/fire-color.png',
      backgroundActive: Color.fromRGBO(82, 195, 255, 1),
    ),
    BadgeModel(
      index: 1,
      title: 'Popular',
      iconActive: 'assets/images/png/thunder.png',
      icon: 'assets/images/png/thunder-color.png',
      backgroundActive: Color.fromRGBO(249, 174, 43, 1),
    ),
  ];
}
