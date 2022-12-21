import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logis02app/app/routes/pages.dart';
import 'package:logis02app/app/ui/utils/style_utils.dart';

class HojaRutaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              "Hoja Ruta",
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

                  // await pedsCntl.getOrders();

                  EasyLoading.dismiss();
                } catch (err) {
                  EasyLoading.dismiss();
                  EasyLoading.showError(err.toString());
                }
              },
              child: const Icon(
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
              child: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 20,
              ),
            ),
          )
        ],
      ),
      body: Column(children: [
        InkWell(
          onTap: () {
            Get.toNamed(Routes.PEDS);
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            constraints: const BoxConstraints.expand(height: 90),
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 6.0,
                    shadowColor: Colors.black,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'HOJA RUTA : 001',
                            style: TextStyle(
                                fontSize: H5,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.directions,
                                size: 15,
                                color: Color.fromARGB(255, 104, 104, 104),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Código: 00001')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
