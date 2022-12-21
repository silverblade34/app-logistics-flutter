import 'package:get/get.dart';
import 'package:logis02app/app/controllers/hojaruta_controller.dart';

class HojaRutaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HojaRutaController>(() => HojaRutaController());
  }
}
