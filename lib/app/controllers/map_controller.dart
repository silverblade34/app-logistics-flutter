import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logis02app/app/controllers/peds_controller.dart';
import 'package:logis02app/app/data/model/credential/credential_data_state.dart';
import 'package:logis02app/app/data/model/order/order_data.dart';
import 'package:logis02app/app/data/repository/orders_repository.dart';
import 'package:logis02app/app/routes/pages.dart';
import 'package:logis02app/app/ui/utils/style_utils.dart';

class MapController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    setStates();

    super.onReady();
  }

  OrdersRepository _ordersRepository = OrdersRepository();

  RxList<Widget> stateWidgets = RxList<Widget>([]);

  Future<void> setUpdateStates() async {
    final box = GetStorage();
    String token = box.read('token');

    Map<String, dynamic> pedArg = Get.arguments;
    OrderData ped = OrderData.fromJson(jsonDecode(pedArg["ped"]));
    final dt = await _ordersRepository.getOrderById(token: token, id: ped.id);
  }

  late OrderData pedSel;
  late CredentialDataState credStateSel;

  Future<void> setStates(
      {bool initialx = true, bool finalstate = false}) async {
    //token data
    final box = GetStorage();
    String token = box.read('token');

    //pedido data
    final PedsController pedsCntl = Get.find();
    // Map<String, dynamic> pedArg = Get.arguments;

    OrderData ped = pedsCntl.pedSel;

    if (!initialx) {
      final dt = await _ordersRepository.getOrderById(token: token, id: ped.id);
      ped = dt;
    }

    //estados data
    String tbstates_raw = box.read('states');
    // print(tbstates_raw);
    Iterable l = json.decode(tbstates_raw);
    List<CredentialDataState> tbstates_parsed = List<CredentialDataState>.from(
      l.map(
        (model) => CredentialDataState.fromJson(model),
      ),
    );

    //VEMOS SI ESTA EN UN ESTADO FINISH=1
    bool aplica = true;
    for (CredentialDataState item in tbstates_parsed) {
      if (ped.code == item.code && item.finish == 1) {
        aplica = false;
      }
    }

    // print(ped.code);

    //SI ESTA EN UN ESTADO FINISH=0
    if (aplica) {
      List<Widget> temp = [];
      for (CredentialDataState item in tbstates_parsed) {
        if (item.ord == (ped.ord + 1)) {
          temp.add(
            InkWell(
              onTap: () async {
                try {
                  if (item.finish == 1) {
                    credStateSel = item;
                    pedSel = ped;
                    Get.toNamed(Routes.CONFIRM);
                  } else {
                    EasyLoading.show(status: "Cargando");
                    await _ordersRepository.updateStateOrder(
                        token: token, id: ped.id, code: item.code);
                    await setStates(initialx: false);

                    await pedsCntl.getOrders();
                    EasyLoading.dismiss();
                  }
                } catch (err) {
                  EasyLoading.dismiss();
                  EasyLoading.showError(err.toString());
                }
              },
              child: Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints.expand(height: 60),
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: const BoxDecoration(
                  color: INFO,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Text(
                  item.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: H5, color: Colors.white),
                ),
              ),
            ),
          );
        }
      }

      stateWidgets.value = temp;
    } else {
      stateWidgets.value = [
        Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints.expand(height: 60),
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "--Pedido finalizado--",
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: P1, color: Color.fromARGB(255, 86, 86, 86)),
          ),
        )
      ];
    }
  }
}
