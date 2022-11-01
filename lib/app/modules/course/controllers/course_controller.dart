import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:online_course/app/data/models/class_model.dart';
import 'package:online_course/app/vo/badge_model.dart';

class CourseController extends GetxController {
  late ClassModel classData;
  final badge = [
    BadgeModel(
      index: 0,
      title: 'All',
      iconActive: 'assets/images/png/fire.png',
      icon: 'assets/images/png/fire-color.png',
      backgroundActive: Get.theme.primaryColor,
    ),
    BadgeModel(
      index: 1,
      title: 'Ongoing',
      iconActive: 'assets/images/png/star.png',
      icon: 'assets/images/png/star-color.png',
      backgroundActive: Color.fromRGBO(115, 131, 192, 1),
    ),
    BadgeModel(
      index: 2,
      title: 'Complete',
      iconActive: 'assets/images/png/thunder.png',
      icon: 'assets/images/png/thunder-color.png',
      backgroundActive: Color.fromRGBO(249, 174, 43, 1),
    ),
  ];
  @override
  void onInit() {
    super.onInit();
    update(['course-badge']);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void changeTab(int index) {
    var tempBadge = [...badge];
    for (var e in badge) {
      if (e.index == index && !e.isActive) {
        e.isActive = true;
      } else {
        e.isActive = false;
      }
    }
    badge.assignAll(tempBadge);
    update(['course-badge']);
  }

  void fillClassData() {
    // for (var i = 1; i <= 5; i++) {
    //   classData = ClassModel(
    //       title: 'Class $i',
    //       description: 'Description $i',
    //       thumbnail: '',
    //       completePercent: 100);
    // }
  }
}
