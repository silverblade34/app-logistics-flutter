import 'package:get/get.dart';
import 'package:logis02app/app/controllers/peds_controller.dart';

class PedsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PedsController>(() => PedsController());
  }
}
