import 'dart:convert';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';

const baseUrl = 'http://67.207.87.64:3222';

class FinalPedApi extends GetConnect {
  Future<Response> getSubEstsFromState(
      {required String token, required String keyreason}) async {
    Map<String, String> headers = {"Authorization": "Bearer $token"};

    final raw = await get(
            "$baseUrl/api/v1/unit/reason/movil?keyReason=$keyreason",
            headers: headers)
        .timeout(const Duration(milliseconds: 8000));
    if (raw.statusCode == 200) {
      return raw;
    } else if (raw.statusCode == 400) {
      final parsed = raw.body;
      throw parsed["message"];
    } else {
      throw "Problema de conexión con el origen de datos";
    }
  }

  Future<Response> insertCommentAndMotiv(
      {required String token, required Map<String, dynamic> rawbody}) async {
    Map<String, String> headers = {"Authorization": "Bearer $token"};

    final raw = await post(
            "$baseUrl/api/v1/agregate/comment", jsonEncode(rawbody),
            headers: headers)
        .timeout(const Duration(milliseconds: 8000));
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
