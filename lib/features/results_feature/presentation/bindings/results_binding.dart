import 'package:final_project/features/filter_feature/presentation/controllers/filter_controller.dart';
import 'package:final_project/features/home_feature/presentation/controllers/home_controller.dart';
import 'package:final_project/features/results_feature/presentation/controllers/results_controller.dart';
import 'package:get/get.dart';

class ResultsBinding extends Bindings{
  @override
  void dependencies() {
  Get.put<ResultsController>(ResultsController());
  }


}