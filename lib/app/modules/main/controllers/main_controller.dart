import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainController extends GetxController {
  late PageController pageController;
  List<PersistentBottomNavBarItem> menus = [
    PersistentBottomNavBarItem(
      iconSize: 30,
      icon: Icon(
        CupertinoIcons.house_alt_fill,
        size: 20,
      ),
      title: 'Home',
      activeColorPrimary: Get.theme.primaryColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      iconSize: 30,
      icon: Icon(
        CupertinoIcons.book,
        size: 20,
      ),
      title: 'Book',
      activeColorPrimary: Get.theme.primaryColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      iconSize: 30,
      icon: Icon(
        CupertinoIcons.bell_fill,
        size: 20,
      ),
      title: 'Notification',
      activeColorPrimary: Get.theme.primaryColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      iconSize: 30,
      icon: Icon(
        CupertinoIcons.person_alt,
        size: 20,
      ),
      title: 'Profile',
      activeColorPrimary: Get.theme.primaryColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
  late PersistentTabController persistentController;

  @override
  void onClose() {}
}
