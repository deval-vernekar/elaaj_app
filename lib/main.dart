import 'package:elaajapp/controllers/popular_doctor_controller.dart';
import 'package:elaajapp/email_login/auth_page.dart';
import 'package:elaajapp/firebase_options.dart';
import 'package:elaajapp/routes/routes_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/available_doctor_controller.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  await dep
      .init(); //this line is for lavarel connection and only this is changed in main file
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Stripe.publishableKey =
  //     'pk_test_51NBFeiSGt5UMJRDDPPddm8XWqCfIY43ySPLTCxWv0rx3QUMAXRnH8JzYtvG5pLAvTE1ac295atVIBSpWhsMivhc300ovKl4EA0';

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //this for push navigation
  static final navigatorKey = GlobalKey<NavigatorState>();
  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    Get.find<PopularDoctorController>().getDoctorList();
    Get.find<AvailableDoctorController>().getAvailableDoctorList();
    //define Themedata here
    return GetBuilder<PopularDoctorController>(builder: (_) {
      return GetBuilder<PopularDoctorController>(builder: (_) {
        return GetMaterialApp(
          title: 'Flutter Doctor App',
          theme: ThemeData(
            fontFamily: "poppins",
          ),
          //this is initial route of the app
          debugShowCheckedModeBanner: false,
          // initialRoute: 'login_page',
          // routes: {
          //   'login_page': (context) => LoginPage(),
          //   'verify': (context) => VerifyPage(),
          //   'home': (context) => HomePage(),
          //   // 'main': (context)=> const MainLayout(),
          // },

          home: AuthPage(),
          initialRoute: RouteHelper.getSplashScreen(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}
