import 'package:elaajapp/data/repository/popular_doctors_repo.dart';
import 'package:elaajapp/models/doctors_model.dart';
import 'package:get/get.dart';

import '../data/repository/available_doctor_repo.dart';

class AvailableDoctorController extends GetxController {
  final AvailableDoctorRepo availableDoctorRepo;
  AvailableDoctorController({required this.availableDoctorRepo});
  List<dynamic> _availableDoctorList = [];
  List<dynamic> get popularDoctorList => _availableDoctorList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getAvailableDoctorList() async {
    Response response = await availableDoctorRepo.getAvailableDoctorList();
    if (response.statusCode == 200) {
      print("Doctors Available");
      _availableDoctorList = [];
      _availableDoctorList
          .addAll(Doctors.fromJson(response.body).doctors as Iterable);
      print(_availableDoctorList);
      _isLoaded = true;
      update();
    } else {
      print("Doctors Not Available");
    }
  }
}
