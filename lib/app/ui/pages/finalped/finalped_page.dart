import 'dart:convert';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logis02app/app/controllers/finalped_controller.dart';
import 'package:logis02app/app/controllers/map_controller.dart';
import 'package:logis02app/app/routes/pages.dart';
import 'package:logis02app/app/ui/utils/style_utils.dart';

class FinalPedPage extends GetView<FinalPedController> {
  @override
  Widget build(BuildContext context) {
    print("noppp");

    final MapController mapCntl = Get.find();
    // print(mapCntl.credStateSel.toJson());
    // print(mapCntl.pedSel.toJson());

    // OrderData orderDt = OrderData.fromJson(jsonDecode(dtArg["ped"]));
    // CredentialDataState stateDt =
    //     CredentialDataState.fromJson(jsonDecode(dtArg["state"]));

    // print(orderDt.toJson());
    // print(stateDt.toJson());

    return Scaffold(
        backgroundColor: BACKGROUND,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: Row(
            children: [
              const Text(
                'Detalle',
                style: TextStyle(fontSize: P1, color: Colors.black),
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
        ),
        body: SafeArea(
          child: GetBuilder<FinalPedController>(
            builder: (finalPedCntl) {
              return Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.symmetric(horizontal: 15),
                constraints: BoxConstraints.expand(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Text(
                            "Estado:",
                            style: TextStyle(
                                fontSize: P1,
                                color: Color.fromARGB(255, 84, 84, 84)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            mapCntl.credStateSel.name,
                            style: TextStyle(
                                fontSize: H5,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Escribe un comentario:",
                        style: TextStyle(
                            fontSize: P1,
                            color: Color.fromARGB(255, 84, 84, 84)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        textAlignVertical: TextAlignVertical.center,
                        controller: finalPedCntl.commentCtll,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 40, horizontal: 10),
                          border: OutlineInputBorder(),
                          labelText: 'Comentario',
                          prefixIcon: Icon(
                            Icons.code,
                            size: 20,
                          ),
                          // isDense: true,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Seleccione un motivo:",
                        style: TextStyle(
                            fontSize: P1,
                            color: Color.fromARGB(255, 84, 84, 84)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => DropDownTextField(
                          enableSearch: true,
                          clearOption: false,
                          dropDownItemCount: 4,
                          validator: (value) {
                            if (value == null) {
                              return "Requiere selección";
                            } else {
                              return null;
                            }
                          },
                          singleController: finalPedCntl.dropDownMotivoCntl,
                          dropDownList: finalPedCntl.listDropDownMotivo.value,
                          textFieldDecoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.all(0),
                            border: OutlineInputBorder(),
                            labelText: 'Motivo',
                            prefixIcon: Icon(
                              Iconsax.signpost,
                              size: 20,
                            ),
                            isDense: true,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const Text("Tomar Foto"),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () async {
                              await finalPedCntl.setNewFile();
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: PRIMARY,
                              ),
                              width: 30,
                              height: 30,
                              child: const Icon(
                                Icons.photo_camera,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 6),
                          InkWell(
                            onTap: () async {
                              await finalPedCntl.setNewFile();
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: PRIMARY,
                              ),
                              width: 30,
                              height: 30,
                              child: const Icon(
                                Icons.photo_library_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        constraints: const BoxConstraints.expand(height: 220),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          children: [
                            Obx(
                              () => Row(
                                children: finalPedCntl.listPhotos.value,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 35,
                      ),
                      Container(
                        constraints: BoxConstraints.expand(height: 45),
                        color: PRIMARY,
                        child: TextButton(
                          onPressed: () {
                            finalPedCntl.insertCommentAndMotivAndUpdateState();
                          },
                          child: const Text(
                            "CONFIRMAR",
                            style: TextStyle(fontSize: P1, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      // Text(
                      //   "Adjuntar fotos:",
                      //   style: TextStyle(
                      //       fontSize: P1,
                      //       color: Color.fromARGB(255, 84, 84, 84)),
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
