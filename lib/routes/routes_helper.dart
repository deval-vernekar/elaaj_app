import 'package:elaajapp/email_login/login_page.dart';
import 'package:elaajapp/home/articles.dart';
import 'package:elaajapp/home/home.dart';
import 'package:elaajapp/home/main_layout.dart';
import 'package:elaajapp/pages/articles/article_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../splash_screen/splash_screen.dart';

class RouteHelper {
  static const String splashScreen = "/splash-screen";
  static const String initial = "/";
  static const String articles = "/article-pages";
  static const String availableDoctors = "/available-doctors";
  static const String loginPage = "/login-page";

  static String getInitial() => '$splashScreen';
  static String getSplashScreen() => '$initial';
  static String getArticleDetails(int pageId) => '$articles?pageId=$pageId';
  static String getLogin() => '$loginPage';
  //static String getAvailableDoctors(int pageId) =>'$availableDoctors>pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: initial, page: () => MainLayout()),
    GetPage(
        name: articles,
        page: () {
          print("article details");
          var pageId = Get.parameters['pageId'];
          return ArticleDetails(pageId: pageId);
        },
        transition: Transition.fadeIn),
    // GetPage(
    //     name: loginPage,
    //     page: () {
    //       print("login page");
    //       return LoginPage(
    //         onTap: () {},
    //       );
    //     },
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: availableDoctors,
    //     page: () {
    //       print("available doctors");
    //       var pageId = Get.parameters['pageId'];
    //       if (pageId != null) {
    //         return ArticleInfo(pageId: int.parse(pageId));
    //       } else {
    //         print("data not found");
    //       }
    //       //return ArticleInfo(pageId: int.parse(pageId!));
    //     },
    //     transition: Transition.fadeIn),

    // GetPage(
    //   name: availableDoctors,
    //   page: () {
    //     print("available doctors");
    //     var pageId = Get.parameters['pageId'];
    //     if (pageId != null) {
    //       int? id = int.tryParse(pageId);
    //       if (id != null) {
    //         return ArticleInfo(pageId: id);
    //       }
    //     }
    //     print("data not found");
    //     return Container(); // Return an empty container if pageId is null or not a valid integer
    //   },
    //   transition: Transition.fadeIn,
    // ),
  ];
}
