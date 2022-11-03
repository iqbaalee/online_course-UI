// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:online_course/app/components/badge.dart';
import 'package:online_course/app/components/badge_rating.dart';
import 'package:online_course/app/components/card_course.dart';
import 'package:collection/collection.dart';
import 'package:online_course/app/routes/app_pages.dart';
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
                      child: GestureDetector(
                        onTap: () => Get.toNamed(Routes.SEARCH),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(children: [
                            Text(
                              'Search for a course',
                              style: textTitle(
                                size: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                          ]),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Material(
                      color: Get.theme.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Get.bottomSheet(
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 25),
                              height: Get.height * 0.5,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Price',
                                    style: textTitle(size: 20),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  GetBuilder<HomeController>(
                                    id: 'price',
                                    builder: (hC) {
                                      return RangeSlider(
                                        divisions: 10,
                                        values: hC.rangeValues,
                                        max: 1000,
                                        activeColor: Get.theme.primaryColor,
                                        inactiveColor:
                                            Colors.grey.withOpacity(0.2),
                                        labels: RangeLabels(
                                          '\$${hC.minRangeValues.toInt()}',
                                          '\$${hC.maxRangeValues.toInt()}',
                                        ),
                                        onChanged: (value) {
                                          controller.changePrice(value);
                                        },
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Rating',
                                    style: textTitle(size: 20),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: controller.rating
                                        .map(
                                          (e) => BadgeRating(
                                            rating: e,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Category',
                                    style: textTitle(
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: controller.badgeFilter
                                        .mapIndexed((i, e) {
                                      return Row(
                                        children: [
                                          SizedBox.fromSize(
                                            size: Size(150, 50),
                                            child: Badge(
                                              blurRadius: 4,
                                              offset: Offset(0, 3),
                                              badge: e,
                                            ),
                                          ),
                                          if (i !=
                                              controller.badgeFilter.length - 1)
                                            SizedBox(
                                              width: 10,
                                            ),
                                        ],
                                      );
                                    }).toList(),
                                  ),
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox.fromSize(
                                        size: Size(150, 60),
                                        child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor: Colors.grey,
                                            backgroundColor: Colors.white,
                                            side: BorderSide(
                                              color: Colors.black,
                                              width: 1,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            'Reset',
                                            style: textTitle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox.fromSize(
                                        size: Size(150, 60),
                                        child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor: Colors.blue[800],
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            'Apply',
                                            style: textTitle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
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
                          return CardCourse(
                            cover: 'assets/images/png/programmer.png',
                            title: 'Programming',
                            author: 'Alonzoe Lie',
                            fileCount: 13,
                            timeCount: 80,
                            // aspectRatio: 5 / 4,
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
