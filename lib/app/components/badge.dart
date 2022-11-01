import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_course/app/utils/style.dart';
import 'package:online_course/app/vo/badge_model.dart';

class Badge extends StatelessWidget {
  final BadgeModel badge;
  final double? padding;
  final double? radius;
  const Badge({Key? key, required this.badge, this.radius, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 50),
        color: badge.isActive
            ? badge.backgroundActive
            : Get.theme.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: .1,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          Image.asset(
            badge.isActive ? badge.iconActive : badge.icon,
            width: 35,
            height: 35,
          ),
          SizedBox(width: 10),
          Text(
            badge.title,
            style: textSubtitle(
                color: badge.isActive ? Colors.white : Colors.black,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
