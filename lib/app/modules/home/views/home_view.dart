import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:online_course/app/components/badge.dart';
import 'package:online_course/app/components/custom_input_password.dart';
import 'package:online_course/app/utils/style.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        color: Get.theme.primaryColorLight,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              backgroundColor: Get.theme.scaffoldBackgroundColor,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(35),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  height: 75,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello,',
                              style: textTitle(
                                  size: 20, fontWeight: FontWeight.normal),
                            ),
                            Text(
                              'Alonzoe Lie',
                              style: textTitle(size: 26),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(2),
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          child: SvgPicture.asset(
                            'assets/images/svg/man.svg',
                            width: 35,
                            height: 35,
                          ),
                        ),
                      ]),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 19),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomInputPassword(
                          controller: TextEditingController()),
                      // child: GestureDetector(
                      //   onTap: () => Get.toNamed(Routes.SEARCH),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     padding: EdgeInsets.symmetric(
                      //         horizontal: 15, vertical: 10),
                      //     child: Row(children: [
                      //       Text(
                      //         'Search for a course',
                      //         style: textTitle(
                      //           size: 14,
                      //           fontWeight: FontWeight.normal,
                      //           color: Colors.grey,
                      //         ),
                      //       ),
                      //       Spacer(),
                      //       Icon(
                      //         Icons.search,
                      //         color: Colors.grey,
                      //       ),
                      //     ]),
                      //   ),
                      // ),
                    ),
                    SizedBox(width: 10),
                    Material(
                      color: Get.theme.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {},
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.filter_list,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Courses',
                      style: textTitle(size: 22),
                    ),
                    GetBuilder<HomeController>(
                      init: HomeController(),
                      id: "home-badge",
                      builder: (hC) {
                        return Container(
                          height: 150,
                          // color: Colors.red,
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3.3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 15,
                            ),
                            itemBuilder: (context, index) {
                              final badge = controller.badge[index];
                              return GestureDetector(
                                onTap: () {
                                  controller.onTapBadge(index);
                                },
                                child: Badge(
                                  badge: badge,
                                ),
                              );
                            },
                            itemCount: controller.badge.length,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: Get.height / 2.3,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(top: 20),
                        itemCount: 5,
                        separatorBuilder: (context, index) => SizedBox(
                          width: 10,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return AspectRatio(
                            aspectRatio: .78,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Get.theme.primaryColor,
                              ),
                              height: 100,
                              width: 50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/png/programmer.png',
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Programming',
                                    style: textTitle(
                                        color: Colors.white, size: 18),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Created by Alonzoe Lie',
                                    style: textSubtitle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        size: 14),
                                  ),
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/images/svg/google-docs.svg',
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Text('17 Files',
                                              style: textSubtitle(
                                                  color: Colors.white))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/images/svg/clock.svg',
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Text('40 min',
                                              style: textSubtitle(
                                                  color: Colors.white))
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
