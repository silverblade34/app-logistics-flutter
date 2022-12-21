import 'dart:async';
import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logis02app/app/data/model/order/order.dart';
import 'package:logis02app/app/data/model/order/order_data.dart';
import 'package:logis02app/app/data/repository/orders_repository.dart';
import 'package:logis02app/app/routes/pages.dart';

class PedsController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    print("INICIOOO CARTAGOOOO");
    EasyLoading.show(status: "Cargando");

    getOrders()
        .then((value) => EasyLoading.dismiss())
        .onError((error, stackTrace) => EasyLoading.dismiss())
        .then((value) {
      timer = Timer.periodic(
          const Duration(seconds: 60),
          (Timer t) => getOrders()
              .then((value) => EasyLoading.dismiss())
              .onError((error, stackTrace) => EasyLoading.dismiss()));
    });
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    timer?.cancel();
    super.onClose();
  }

  Timer? timer;

  OrdersRepository _ordersRepository = OrdersRepository();

  RxList<OrderData> ordersData = RxList<OrderData>([]);

  Future<void> test() async {
    final box = GetStorage();

    bool isLogged = box.read('isLogged') ?? false;
    String plate = box.read('plate') ?? "NOHAY";

    // print(isLogged);
    // print(plate);
  }

  Future<void> getOrders() async {
    final box = GetStorage();

    String token = box.read('token') ?? "";
    String plate = box.read('plate') ?? "NOHAY";

    Order dt = await _ordersRepository.getOrders(token: token, plate: plate);
    ordersData.value = dt.data;
    // print(dt.data);
  }

  late OrderData pedSel;

  toMapOrder({required OrderData ped}) {
    pedSel = ped;
    // Get.toNamed(Routes.MAP, arguments: {"ped": jsonEncode(ped)});
    Get.toNamed(Routes.MAP);
  }
}
