import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:online_course/app/vo/badge_model.dart';

class HomeController extends GetxController {
  final badge = [
    BadgeModel(
      index: 0,
      title: 'All Topic',
      iconActive: 'assets/images/png/fire.png',
      icon: 'assets/images/png/fire-color.png',
      backgroundActive: Get.theme.primaryColor,
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
  @override
  // void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {}

  void onTapBadge(int index) {
    var tempBadge = [...badge];
    for (var e in badge) {
      if (e.index == index && !e.isActive) {
        e.isActive = true;
      } else {
        e.isActive = false;
      }
    }
    badge.assignAll(tempBadge);
    update(['home-badge']);
  }
}
