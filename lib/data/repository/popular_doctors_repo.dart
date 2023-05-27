import 'package:elaajapp/data/api/api_client.dart';
import 'package:elaajapp/utility/app_constants.dart';
import 'package:get/get.dart';

class PopularDoctorRepo extends GetxService {
  final ApiClient apiClient;
  PopularDoctorRepo({required this.apiClient});
  Future<Response> getPopularDoctorList() async {
    return await apiClient.getData(AppConstants.POPULAR_DOCTORS_URI);
  }
}
