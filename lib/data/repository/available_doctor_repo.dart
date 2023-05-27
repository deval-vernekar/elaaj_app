import 'package:elaajapp/data/api/api_client.dart';
import 'package:elaajapp/utility/app_constants.dart';
import 'package:get/get.dart';

class AvailableDoctorRepo extends GetxService {
  final ApiClient apiClient;
  AvailableDoctorRepo({required this.apiClient});
  Future<Response> getAvailableDoctorList() async {
    return await apiClient.getData(AppConstants.POPULAR_DOCTORS_URI);
  }
}
