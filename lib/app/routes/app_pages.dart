import 'package:get/get.dart';

import 'package:online_course/app/modules/class_detail/bindings/class_detail_binding.dart';
import 'package:online_course/app/modules/class_detail/views/class_detail_view.dart';
import 'package:online_course/app/modules/course/bindings/course_binding.dart';
import 'package:online_course/app/modules/course/views/course_view.dart';
import 'package:online_course/app/modules/home/bindings/home_binding.dart';
import 'package:online_course/app/modules/home/views/home_view.dart';
import 'package:online_course/app/modules/main/bindings/main_binding.dart';
import 'package:online_course/app/modules/main/views/main_view.dart';
import 'package:online_course/app/modules/search/bindings/search_binding.dart';
import 'package:online_course/app/modules/search/views/search_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.COURSE,
      page: () => CourseView(),
      binding: CourseBinding(),
    ),
    GetPage(
      name: _Paths.CLASS_DETAIL,
      page: () => ClassDetailView(),
      binding: ClassDetailBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
  ];
}
