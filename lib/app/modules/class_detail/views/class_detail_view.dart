import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:online_course/app/utils/style.dart';
import 'package:video_player/video_player.dart';

import '../controllers/class_detail_controller.dart';

class ClassDetailView extends GetView<ClassDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Design Thinking',
          style: textTitle(size: 18, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: BackButton(
          color: Colors.black,
        ),
        toolbarHeight: kToolbarHeight + 20,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(290),
          child: Container(
            color: Get.theme.primaryColorLight,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Obx(
                          () => controller.isLoading.isFalse
                              ? VideoPlayer(
                                  controller.videoPlayerController,
                                )
                              : DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Get.theme.scaffoldBackgroundColor),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Get.theme.primaryColor,
                                    ),
                                  ),
                                ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 7.5),
                            height: 45,
                            decoration: BoxDecoration(
                              color: Get.theme.primaryColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.changeStatusPlay();
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.4),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Obx(
                                      () => Icon(
                                        controller.isPlaying.isTrue
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '16:20 / 18:90',
                                  style: textTitle(
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                Spacer(),
                                ClipOval(
                                  child: SizedBox.fromSize(
                                    size: Size(25, 25),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          controller.changeStatusVolume();
                                        },
                                        child: Obx(
                                          () => SvgPicture.asset(
                                            controller.isOnVolume.isTrue
                                                ? 'assets/images/svg/volume-on.svg'
                                                : 'assets/images/svg/volume-mute.svg',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                ClipOval(
                                  child: SizedBox.fromSize(
                                    size: Size(30, 30),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {},
                                        child: Icon(
                                          Icons.fullscreen,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  width: Get.width,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: kToolbarHeight * 3.2,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Playlist',
                              style: textSubtitle(color: Colors.white),
                            ),
                            SizedBox(width: 5),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.4),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              child: Text(
                                '16',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: kToolbarHeight * 3.2,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(
                            'Description',
                            style: textSubtitle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        actions: [
          Container(
            height: 28,
            width: 28,
            padding: EdgeInsets.all(6),
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/svg/love.svg',
                color: Colors.white,
                width: 20,
                height: 20,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight + 40,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                blurRadius: 5,
                spreadRadius: 3,
                offset: const Offset(0, 4),
              )
            ],
            color: Get.theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox.fromSize(
                  size: Size(115, 45),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipOval(
                          child: Material(
                            color: Colors.white,
                            child: SizedBox.fromSize(
                              size: Size.square(30),
                              child: Icon(
                                Icons.label,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ),
                        Text('\$35.53'),
                      ],
                    ),
                  ),
                ),
                SizedBox.fromSize(
                  size: Size((Get.width / 2) + 25, 60),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Get.theme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Buy Now'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(color: Get.theme.primaryColorLight),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, i) {
                  return Column(
                    children: [
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 80,
                        child: Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    i % 2 == 0
                                        ? Colors.blue[200]!
                                        : Colors.grey,
                                    i % 2 == 0
                                        ? Colors.blue[300]!
                                        : Colors.grey,
                                  ],
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: i % 2 == 0
                                  ? Center(
                                      child: Icon(
                                        Icons.play_arrow_rounded,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    )
                                  : Center(child: Text('$i')),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Introduction to Design Thinking',
                                  style: textTitle(size: 13),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '06:25 / 17:45',
                                  style: textSubtitle(
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.blue[200]!,
                                    Colors.blue[300]!,
                                  ],
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                i % 2 == 1 ? Icons.lock : Icons.lock_open,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                childCount: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
