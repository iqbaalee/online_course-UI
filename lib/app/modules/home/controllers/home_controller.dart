import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_course/app/vo/badge_model.dart';

class HomeController extends GetxController {
  final rating = [2, 3, 4, 5];
  final badge = BadgeModel.badge;
  final badgeFilter = BadgeModel.badgeFilter;
  final double maxRangeValues = 500;
  final double minRangeValues = 0;
  RangeValues rangeValues = RangeValues(0, 500);
  @override
  void onInit() {
    super.onInit();
    rangeValues = RangeValues(minRangeValues, maxRangeValues);
  }

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

  void changePrice(RangeValues value) {
    rangeValues = value;
    update(['price']);
  }
}
