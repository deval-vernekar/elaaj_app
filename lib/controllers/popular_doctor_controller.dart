import 'package:elaajapp/data/repository/popular_doctors_repo.dart';
import 'package:elaajapp/models/doctors_model.dart';
import 'package:get/get.dart';

class PopularDoctorController extends GetxController {
  final PopularDoctorRepo popularDoctorRepo;
  PopularDoctorController({required this.popularDoctorRepo});
  List<dynamic> _popularDoctorList = [];
  List<dynamic> get popularDoctorList => _popularDoctorList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getDoctorList() async {
    Response response = await popularDoctorRepo.getPopularDoctorList();
    if (response.statusCode == 200) {
      print("Got Doctors");
      _popularDoctorList = [];
      _popularDoctorList
          .addAll(Doctors.fromJson(response.body).doctors as Iterable);
      print(_popularDoctorList);
      _isLoaded = true;
      update();
    } else {}
  }
}
