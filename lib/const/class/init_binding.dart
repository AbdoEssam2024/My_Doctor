import 'package:get/get.dart';
import 'package:my_doctor/const/class/internet_service.dart';
import 'package:my_doctor/web_services/api_calls.dart';

class InitialBindings extends Bindings {

  @override
  void dependencies() {
    Get.put(ApiCalls());
    Get.put(InternetService());
  }
}
