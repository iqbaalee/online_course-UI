import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:online_course/app/data/models/onboarding_model.dart';

class OnboardingController extends GetxController {
  late PageController pageController;
  final onboarding = [
    OnboardingModel(
      index: 0,
      title: 'Find Your Favourite Lesson',
      description:
          'Anyone can join the millions of members in our community to learn and share knowledge',
      image: 'assets/images/png/programmer.png',
      isActive: true,
    ),
    OnboardingModel(
      index: 1,
      title: 'Discover Useful Resources',
      description:
          'This is an online learning app that gives access to all comprehensive resources',
      image: 'assets/images/png/thunder.png',
    ),
    OnboardingModel(
      index: 2,
      title: 'Try To Learn Something New',
      description:
          'You can learn anything from programming to marketing, from design to data science',
      image: 'assets/images/png/fire.png',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void scrollOnboarding(value) {
    var tempOnboarding = [...onboarding];
    for (var e in onboarding) {
      if (e.index == value) {
        e.isActive = true;
      } else {
        e.isActive = false;
      }
    }
    onboarding.assignAll(tempOnboarding);
    update(['onboarding']);
  }
}
