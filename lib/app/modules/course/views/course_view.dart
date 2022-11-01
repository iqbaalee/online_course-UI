import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:online_course/app/components/badge.dart';
import 'package:online_course/app/routes/app_pages.dart';
import 'package:online_course/app/utils/style.dart';

import '../controllers/course_controller.dart';

class CourseView extends GetView<CourseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        title: Text(
          'My Courses',
          style: textTitle(size: 18),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            splashRadius: 20,
            padding: EdgeInsets.all(8),
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/images/svg/magnifying-glass.svg',
            ),
          ),
        ],
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Theme.of(context).primaryColorLight,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              pinned: true,
              floating: true,
              toolbarHeight: kToolbarHeight + 30,
              flexibleSpace: GetBuilder<CourseController>(
                id: "course-badge",
                builder: (cC) {
                  return Container(
                    color: Get.theme.primaryColorLight,
                    height: 70,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 10);
                      },
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.changeTab(index);
                          },
                          child: Badge(
                            badge: controller.badge[index],
                            radius: 50,
                          ),
                        );
                      },
                      itemCount: controller.badge.length,
                    ),
                  );
                },
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverToBoxAdapter(
                child: Stack(children: [
                  Positioned(
                    child: Container(
                      height: 150,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: .1,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: Get.width / 2,
                                child: Text(
                                  "Find a course you want to learn !",
                                  style:
                                      textTitle(size: 18, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 15),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Check Now',
                                  style: textSubtitle(),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Image.asset(
                      'assets/images/png/handle-phone.png',
                      width: 176,
                    ),
                  )
                ]),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return _ClassItem();
                  },
                  childCount: 5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ClassItem extends StatelessWidget {
  const _ClassItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.CLASS_DETAIL),
      child: Container(
        decoration: BoxDecoration(
          color: Get.theme.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        width: Get.width,
        constraints: BoxConstraints(
          minHeight: 100,
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/images/svg/energy.svg',
              height: 100,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Creative Design',
                    style: textTitle(size: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Lorem ipsum dolor sit amet consectetur consectetu rectetur consectetur',
                    style: textSubtitle(
                        size: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Completed',
                    style: textSubtitle(size: 12, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: 0.1,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
