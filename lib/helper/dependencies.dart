import 'package:elaajapp/controllers/popular_doctor_controller.dart';
import 'package:elaajapp/data/api/api_client.dart';
import 'package:elaajapp/data/repository/popular_doctors_repo.dart';
import 'package:elaajapp/utility/app_constants.dart';
import 'package:get/get.dart';

import '../controllers/available_doctor_controller.dart';
import '../data/repository/available_doctor_repo.dart';

Future<void> init() async {
  //Api Clients
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //Repos
  Get.lazyPut(() => PopularDoctorRepo(apiClient: Get.find()));
  Get.lazyPut(() => AvailableDoctorRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularDoctorController(popularDoctorRepo: Get.find()));
  Get.lazyPut(() => AvailableDoctorController(availableDoctorRepo: Get.find()));
}
