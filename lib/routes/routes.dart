import 'package:get/get.dart';
import 'package:my_portfolio/view/about_view.dart';
import 'package:my_portfolio/view/home_view.dart';
import 'package:my_portfolio/view/soft_skill_view.dart';
import 'package:my_portfolio/view/tech_skill_view.dart';



final allPage = [
  GetPage(name: "/", page: () => HomeView()),
  GetPage(
    name: "/about",
    page: () => AboutView(),
    transition: Transition.circularReveal,
  ),
  GetPage(
    name: "/soft_skill",
    page: () => SoftSkillView(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: "/tech_skill",
    page: () => TechSkillView(),
    transition: Transition.fadeIn,
  ),
];