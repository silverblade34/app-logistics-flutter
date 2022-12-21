import 'package:get/get.dart';
import 'package:logis02app/app/controllers/finalped_controller.dart';

class FinalPedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinalPedController>(() => FinalPedController());
  }
}
