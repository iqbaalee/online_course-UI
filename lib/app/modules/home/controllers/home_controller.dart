import 'package:get/get.dart';
import 'package:online_course/app/vo/badge_model.dart';

class HomeController extends GetxController {
  final rating = [2, 3, 4, 5];
  final badge = BadgeModel.badge;
  final badgeFilter = BadgeModel.badgeFilter;
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
