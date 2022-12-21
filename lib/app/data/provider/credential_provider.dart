import 'dart:convert';
import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';

// /api/v1/driver/login?movil=+51931795550&movilKey=123
const baseUrl = 'http://67.207.87.64:3222';

class CredentialApi extends GetConnect {
  Future<Response> getUserByCred(
      {required String us, required String pa}) async {
    final str = Uri.encodeQueryComponent((us));
    print(str);
    final raw =
        await get("$baseUrl/api/v1/driver/login?movil=$str&movilKey=$pa")
            .timeout(const Duration(milliseconds: 8000));
    if (raw.statusCode == 200) {
      return raw;
    } else if (raw.statusCode == 400) {
      final parsed = raw.body;
      // print(parsed[0]);
      throw parsed["message"];
    } else {
      throw "Problema de conexión con el origen de datos";
    }
  }

  Future<Response> testUploadFile(
      {required String token, required Map<String, dynamic> tempform}) async {
    Map<String, String> headers = {"Authorization": "Bearer $token"};
    print(tempform);
    // Uint8List bytes2 =
    //     (await NetworkAssetBundle(Uri.parse(imageUrl)).load(imageUrl))
    //         .buffer
    //         .asUint8List();
    // final form = FormData({
    //   'file1': MultipartFile(bytes2, filename: 'avatar.jpg'),
    //   'id': '483519a8-5d65-405d-9511-98e8f44d13ea',
    //   'qfile': '1',
    //   'qsignature': '0',
    //   'nameFile': '["cualquuiera"]',
    //   'nameSignature': '["Prueba de firma"]'
    // });
    final form = FormData(tempform);
    final raw = await post(
        'http://67.207.87.64:3222/api/v1/agregate/photo', form,
        headers: headers);
    print('prueba');
    print(raw.body);
    print('prueb2');
    if (raw.statusCode == 200) {
      print("siiiii");
      // print(raw.body);
    }
    if (raw.statusCode == 400) {
      print("status 400");
      // print(raw.body);
    } else {
      print("Problema con las Fotos");
      // print(raw.body);
    }
    return raw;
  }

  Future<Response> testUploadFile2({required String token}) async {
    File tttmp = File("assets/images/logo.png");
    // MultipartFile ff =
    //     MultipartFile((await tttmp.readAsBytes()), filename: 'avatar.png');
    // FormData form = FormData({
    //   'file': ff,
    // });

    FormData formDt = FormData({
      "file": MultipartFile('assets/images/logo.png', filename: 'logo.png')
    });
//     FormData formData = new FormData.from({
//    "name": "wendux",
//    "file1": new UploadFileInfo(new File("./upload.jpg"), "upload1.jpg")
// });

    final raw = await post(
      "http://192.168.1.36:3444/api/v1/agregate/photo",
      formDt,
      contentType: "multipart/form-data",
    ).timeout(const Duration(milliseconds: 8000));
    // final raw = await get("$baseUrl/prueba");

    if (raw.statusCode == 200) {
      return raw;
    } else if (raw.statusCode == 400) {
      final parsed = raw.body;
      throw parsed["message"];
    } else {
      throw "Problema de conexión con el origen de datos";
    }
  }
}
