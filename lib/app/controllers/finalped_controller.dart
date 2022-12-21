import 'dart:io';
import 'dart:typed_data';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logis02app/app/controllers/map_controller.dart';
import 'package:logis02app/app/controllers/peds_controller.dart';
import 'package:logis02app/app/data/model/subest/subest.dart';
import 'package:logis02app/app/data/model/subest/subest_data.dart';
import 'package:logis02app/app/data/repository/credential_repository.dart';
import 'package:logis02app/app/data/repository/finalped_repository.dart';
import 'package:logis02app/app/data/repository/orders_repository.dart';
import 'package:image_picker/image_picker.dart';

class FinalPedController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    EasyLoading.show(status: "Cargando");
    setMotivoDropDown()
        .then((value) => EasyLoading.dismiss())
        .onError((error, stackTrace) => EasyLoading.dismiss());
    super.onReady();
  }

  List<Uint8List> imagesArchived = [];
  List<String> pathsPhoto = [];
  List<Uint8List> signaturesArchived = [];
  RxList<Widget> listPhotos = RxList<Widget>([]);
  List<Widget> tempList = [];
  Map<String, dynamic> tempForm = {};
  final ImagePicker picker = ImagePicker();
  // final XFile? photo = XFile('');
  late File image = File('');
  RxBool isLoad = RxBool(true);
  TextEditingController commentCtll = TextEditingController(text: "");

  SingleValueDropDownController dropDownMotivoCntl =
      SingleValueDropDownController(
          data: DropDownValueModel(name: "SIN SELECCIONAR", value: "-"));

  RxList<DropDownValueModel> listDropDownMotivo = RxList<DropDownValueModel>([
    DropDownValueModel(name: "SIN SELECCIONAR", value: "-"),
  ]);

  FinalPedRepository _finalPedRepository = FinalPedRepository();
  OrdersRepository _ordersRepository = OrdersRepository();
  CredentialRepository _credentialRepository = CredentialRepository();

  MapController mapCntl = Get.find();

  Future<void> setMotivoDropDown() async {
    dropDownMotivoCntl = SingleValueDropDownController(
      data: DropDownValueModel(
        name: "SIN SELECCIONAR",
        value: '-',
      ),
    );
    final box = GetStorage();
    String token = box.read('token');

    String keyreason = mapCntl.credStateSel.key;

    // print("fffffftodo:   $keyreason");

    SubEst dt = await _finalPedRepository.getSubEstsFromState(
        token: token, keyreason: keyreason);

    List<DropDownValueModel> temp = [
      DropDownValueModel(name: "SIN SELECCIONAR", value: "-")
    ];

    for (SubEstData item in dt.data) {
      // print(item.id);
      temp.add(DropDownValueModel(name: item.name, value: item.id));
    }

    listDropDownMotivo.value = temp;
  }

  void validateInpust() {
    // print(dropDownMotivoCntl.dropDownValue!.value);

    dropDownMotivoCntl.dropDownValue!.value == "-"
        ? throw Exception("Falta escoger el motivo")
        : null;
  }

  Future<void> insertCommentAndMotivAndUpdateState() async {
    try {
      EasyLoading.show(status: "Cargando");
      validateInpust();

      final box = GetStorage();
      String token = box.read('token');
      await testUploadFile(token: token, tempForm: tempForm);

      await _ordersRepository.updateStateOrder(
        token: token,
        id: mapCntl.pedSel.id,
        code: mapCntl.credStateSel.code,
      );

      String keyreason = mapCntl.credStateSel.key;

      await _finalPedRepository.insertCommentAndMotiv(
        token: token,
        id: mapCntl.pedSel.id,
        comment: commentCtll.text,
        idmotiv: dropDownMotivoCntl.dropDownValue!.value,
        keyreason: keyreason,
      );

      await mapCntl.setStates(initialx: false);

      PedsController pedsCntl = Get.find();
      await pedsCntl.getOrders();

      EasyLoading.dismiss();
      Get.back();
    } catch (err) {
      EasyLoading.dismiss();
      EasyLoading.showError(err.toString());
    }
  }

  Future<void> setNewFile() async {
    final box = GetStorage();
    String token = box.read('token');

    XFile? photo =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 60);
    final temp = await photo!.readAsBytes();
    // print(temp);
    imagesArchived.add(temp);

    pathsPhoto.add(photo.path);
    image = File(photo.path);
    listPhotos.add(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.file(
            image,
            width: 180,
            height: 220,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );

    int count = 0;
    List<String> arrayFile = [];
    for (Uint8List img in imagesArchived) {
      arrayFile.insert(count, '"imagen de prueba"');
      count += 1;
      tempForm["file$count"] = MultipartFile(img, filename: 'img$count.jpg');
    }
    print(count);
    tempForm["qfile"] = count.toString();
    tempForm["id"] = mapCntl.pedSel.id.toString();
    tempForm["qsignature"] = '0';
    tempForm["nameFile"] = '$arrayFile';
    tempForm["nameSignature"] = '["Prueba de Image"]';
  }

  Future<void> testUploadFile(
      {required String token, required Map<String, dynamic> tempForm}) async {
    print(tempForm);
    await _credentialRepository.testUploadFile(
        token: token, tempform: tempForm);
  }
}
