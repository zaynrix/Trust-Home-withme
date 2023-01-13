import 'package:final_project/core/app_network/network_info.dart';
import 'package:final_project/features/home_feature/presentation/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<Dio>(Dio());
    Get.put<InternetConnectionChecker>(InternetConnectionChecker());
    Get.put<NetworkInfo>(NetworkInfoImp(connectionChecker: Get.find()));
  }
}