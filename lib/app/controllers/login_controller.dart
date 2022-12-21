import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logis02app/app/data/model/credential/credential.dart';
import 'package:logis02app/app/data/repository/credential_repository.dart';
import 'package:logis02app/app/routes/pages.dart';

class LoginController extends GetxController {
  CredentialRepository _credentialRepository = CredentialRepository();

  TextEditingController unidadcntll = TextEditingController(text: "");
  TextEditingController clavecntll = TextEditingController(text: "");
  RxBool obscurePass = RxBool(true);

  validateInputsLogin() {
    try {
      unidadcntll.text.isEmpty ? throw "Rellena el campo unidad" : null;
      clavecntll.text.isEmpty ? throw "Rellena el campo clave" : null;
    } catch (err) {
      EasyLoading.showError(err.toString());
      throw err;
    }
  }

  Future<void> loginByCred() async {
    validateInputsLogin();
    try {
      Credential user = await _credentialRepository.getUserByCred(
          us: unidadcntll.text, pa: clavecntll.text);
      final box = GetStorage();
      // print(user.data.unit);
      await box.write('isLogged', true);
      await box.write('token', user.data.bearer_token);
      await box.write('plate', user.data.unit);
      await box.write('states', jsonEncode(user.data.states));

      // Get.offAllNamed(Routes.PEDS);
      Get.offAllNamed(Routes.HOJARUT);
    } catch (err) {
      EasyLoading.showError(err.toString());
    }
  }
}
