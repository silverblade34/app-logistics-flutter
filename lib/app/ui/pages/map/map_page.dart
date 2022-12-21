import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logis02app/app/controllers/map_controller.dart';
import 'package:logis02app/app/controllers/peds_controller.dart';
import 'package:logis02app/app/data/model/order/order_data.dart';
import 'package:logis02app/app/routes/pages.dart';
import 'package:logis02app/app/ui/utils/style_utils.dart';

class MapPage extends GetView<MapController> {
  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> pedArg = Get.arguments;
    // OrderData ped = OrderData.fromJson(jsonDecode(pedArg["ped"]));

    final PedsController pedsCntl = Get.find();
    OrderData ped = pedsCntl.pedSel;
    return Scaffold(
      backgroundColor: BACKGROUND,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            const Text(
              'Detalle',
              style: TextStyle(fontSize: H5, color: Colors.black),
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
        // leading: InkWell(
        //   onTap: () {
        //     Get.offNamed(Routes.PEDS);
        //   },
        //   child: const Icon(
        //     Iconsax.arrow_left,
        //     size: 30,
        //   ),
        // ),
      ),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                constraints: const BoxConstraints.expand(height: 120),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 7,
                      blurRadius: 10,
                      offset: Offset(1, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      ped.name,
                      style: const TextStyle(
                        fontSize: H3,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          size: 15,
                          color: Color.fromARGB(255, 104, 104, 104),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          ped.date,
                          style: const TextStyle(
                            fontSize: P2,
                            color: Color.fromARGB(255, 104, 104, 104),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.directions,
                          size: 15,
                          color: Color.fromARGB(255, 104, 104, 104),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          ped.direction,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: P2, color: INFO),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                constraints: const BoxConstraints.expand(height: 20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  "Estados",
                  style: TextStyle(
                      fontSize: P2, color: Color.fromARGB(255, 93, 93, 93)),
                ),
              ),
              GetBuilder<MapController>(builder: (mapCntl) {
                return Expanded(
                    child: Obx(
                  () => Container(
                    constraints: const BoxConstraints.expand(),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: mapCntl.stateWidgets.value,
                      ),
                    ),
                  ),
                ));
              }),
            ],
          ),
        ),
      ),
    );
  }
}



// ListView.builder(
//   itemCount: 4,
//   itemBuilder: (_, __) {
//     return InkWell(
//       onTap: () {},
//       child: Container(
//         alignment: Alignment.center,
//         constraints: const BoxConstraints.expand(height: 60),
//         margin: const EdgeInsets.symmetric(vertical: 5),
//         padding: const EdgeInsets.symmetric(horizontal: 15),
//         decoration: const BoxDecoration(
//           color: INFO,
//           borderRadius: BorderRadius.all(Radius.circular(30)),
//         ),
//         child: Text(
//           "ESTADO 1",
//           style: TextStyle(fontSize: H5, color: Colors.white),
//         ),
//       ),
//     );
//   },
// ),