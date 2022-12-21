import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logis02app/app/controllers/peds_controller.dart';
import 'package:logis02app/app/routes/pages.dart';
import 'package:logis02app/app/ui/utils/style_utils.dart';

class PedsPage extends GetView<PedsController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PedsController>(
      builder: (pedsCntl) {
        return Scaffold(
          backgroundColor: BACKGROUND,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            title: Row(
              children: [
                const Text(
                  "Pedidos",
                  style: TextStyle(
                    fontSize: H5,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () async {
                    try {
                      EasyLoading.show(status: "Cargando");

                      await pedsCntl.getOrders();

                      EasyLoading.dismiss();
                    } catch (err) {
                      EasyLoading.dismiss();
                      EasyLoading.showError(err.toString());
                    }
                  },
                  child: Icon(
                    Icons.refresh,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  constraints: BoxConstraints.expand(width: 120, height: 25),
                  child: Image.asset(
                    pathLogoBanner,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.white,
            actions: [
              InkWell(
                onTap: () async {
                  final box = GetStorage();
                  await box.erase();
                  Get.offAllNamed(Routes.INITIAL);
                },
                child: Container(
                  width: 30,
                  height: 30,
                  color: Colors.redAccent,
                  child: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
          body: SafeArea(
            child: Container(
              constraints: BoxConstraints.expand(),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Pendientes",
                      style: TextStyle(
                          fontSize: P2, color: Color.fromARGB(255, 82, 82, 82)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() => Expanded(
                        child: ListView.builder(
                          itemCount: pedsCntl.ordersData.length,
                          itemBuilder: (BuildContext cntx, int it) {
                            return InkWell(
                              onTap: pedsCntl.ordersData[it].finish == 1
                                  ? () {
                                      pedsCntl.toMapOrder(
                                          ped: pedsCntl.ordersData[it]);
                                    }
                                  : () {
                                      if (pedsCntl.ordersData[it].finish == 2) {
                                        EasyLoading.dismiss();
                                        EasyLoading.showInfo(
                                            "Pedido entregado");
                                      } else if (pedsCntl
                                              .ordersData[it].finish ==
                                          3) {
                                        EasyLoading.dismiss();
                                        EasyLoading.showInfo(
                                            "Pedido rechazado");
                                      }
                                    },
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                constraints:
                                    const BoxConstraints.expand(height: 90),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            pedsCntl.ordersData[it].name,
                                            style: const TextStyle(
                                                fontSize: H5,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.calendar_month,
                                                size: 15,
                                                color: Color.fromARGB(
                                                    255, 104, 104, 104),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                pedsCntl.ordersData[it].date,
                                                style: const TextStyle(
                                                  fontSize: P2,
                                                  color: Color.fromARGB(
                                                      255, 104, 104, 104),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.directions,
                                                size: 15,
                                                color: Color.fromARGB(
                                                    255, 104, 104, 104),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Direccion: ${pedsCntl.ordersData[it].direction}",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: P2, color: INFO),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        constraints:
                                            const BoxConstraints.expand(
                                                width: 50),
                                        child: pedsCntl.ordersData[it].finish ==
                                                2
                                            ? Icon(
                                                Icons.check_box,
                                                size: 35,
                                                color: Color.fromARGB(
                                                    255, 54, 113, 56),
                                              )
                                            : pedsCntl.ordersData[it].finish ==
                                                    3
                                                ? Icon(
                                                    Icons.error,
                                                    size: 35,
                                                    color: Color.fromARGB(
                                                        255, 210, 64, 64),
                                                  )
                                                : null)
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
