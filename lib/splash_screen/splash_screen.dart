import 'dart:async';

import 'package:elaajapp/controllers/available_doctor_controller.dart';
import 'package:elaajapp/controllers/popular_doctor_controller.dart';
import 'package:elaajapp/email_login/login_page.dart';
import 'package:elaajapp/routes/routes_helper.dart';
import 'package:elaajapp/utility/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  //timestamp splash screen 1:45 part2
  // Future<void> _loadResources() async {
  //   await Get.find<PopularDoctorController>().getDoctorList();
  //   await Get.find<AvailableDoctorController>().getAvailableDoctorList();
  // }

  @override
  void initState() {
    super.initState();
    //_loadResources();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward();
    //controller = controller.forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(
        const Duration(seconds: 3),
        () => Get.offNamed(
            RouteHelper.getInitial())); //Get.offNamed(RouteHelper.initial)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4079d9),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ScaleTransition(
          scale: animation,
          child: Center(
            child: Image.asset(
              "asset/images/elaaj-logo.png",
              width: Dimensions.splashImg,
            ),
          ),
        ),
      ]),
    );
  }
}
