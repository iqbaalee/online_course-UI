import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:online_course/app/components/onboarding_indicator.dart';
import 'package:online_course/app/routes/app_pages.dart';
import 'package:online_course/app/utils/style.dart';

import '../controllers/onboarding_controller.dart';
import 'package:collection/collection.dart';

class OnboardingView extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Get.theme.scaffoldBackgroundColor,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
        ),
        child: Stack(
          children: [
            Positioned.fromRelativeRect(
              rect: RelativeRect.fromLTRB(0, Get.width * .5, 0, 0),
              child: PageView(
                controller: controller.pageController,
                onPageChanged: (value) {
                  controller.scrollOnboarding(value);
                },
                physics: BouncingScrollPhysics(),
                children: controller.onboarding.mapIndexed((index, e) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/png/fire.png',
                          width: Get.width * .4,
                        ),
                        SizedBox(height: 40),
                        Text(
                          e.title,
                          style: textTitle(size: 18),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 100,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Get.theme.primaryColor,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          e.description,
                          style: textSubtitle(size: 14),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Positioned.fromRelativeRect(
              rect: RelativeRect.fromLTRB(0, Get.height * .5, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.onboarding.map((e) {
                  return Row(
                    children: [
                      e.isActive == true
                          ? OnboardingIndicator()
                          : Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Get.theme.primaryColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                      SizedBox(width: 10),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          width: Get.width,
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Get.theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            onPressed: () {
              Get.toNamed(Routes.MAIN);
            },
            child: Text(
              'Get Started',
              style: textTitle(
                size: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Images extends StatelessWidget {
  const Images({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/png/programmer.png');
  }
}
