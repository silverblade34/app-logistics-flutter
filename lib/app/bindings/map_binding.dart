import 'package:get/get.dart';
import 'package:logis02app/app/controllers/map_controller.dart';

class MapBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapController>(() => MapController());
  }
}
