import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:online_course/app/components/card_course.dart';
import 'package:online_course/app/components/custom_text_field.dart';
import 'package:online_course/app/routes/app_pages.dart';
import 'package:online_course/app/utils/style.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        elevation: 0,
        title: Text(
          'Search',
          style: textTitle(size: 18),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        actions: [
          Container(
            height: 30,
            width: 30,
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.grid_view,
                size: 20,
              ),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            color: Theme.of(context).primaryColorLight,
            width: Get.width,
            child: Column(
              children: [
                SizedBox.fromSize(
                  size: Size(Get.width, 60),
                  child: CustomTextField(
                    autofocus: true,
                    textInputAction: TextInputAction.search,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 50,
                    controller: TextEditingController(),
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      'Search Result',
                      style: textTitle(
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      'assets/images/svg/search.svg',
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
          ),
          child: GridView.count(
            physics: BouncingScrollPhysics(),
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            crossAxisCount: 2,
            childAspectRatio: 0.72,
            children: List.generate(10, (index) {
              return CardCourse(
                onTap: () => Get.toNamed(Routes.CLASS_DETAIL),
                radius: 20,
                cover: 'assets/images/png/programmer.png',
                title: 'title',
                author: 'author',
                fileCount: 12,
                timeCount: 12,
                widthHeightIcon: 20,
                sizeAuthor: 12,
                sizeTitle: 16,
                sizeTextIcon: 10,
              );
            }),
          ),
        ),
      ),
    );
  }
}
