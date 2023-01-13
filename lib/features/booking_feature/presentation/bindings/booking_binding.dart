import 'package:final_project/features/booking_feature/presentation/controllers/booking_controller.dart';
import 'package:get/get.dart';

class BookingBinding implements Bindings{
  @override
  void dependencies() {
   Get.put<BookingController>(BookingController());
  }


}