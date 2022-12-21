import 'dart:convert';

import 'package:get/get.dart';

const baseUrl = 'http://67.207.87.64:3222';

class OrdersApi extends GetConnect {
  Future<Response> getOrders(
      {required String token, required String plate}) async {
    Map<String, String> headers = {"Authorization": "Bearer $token"};

    final raw =
        await get("$baseUrl/api/v1/unit/orders?unit=$plate", headers: headers)
            .timeout(const Duration(milliseconds: 8000));
    if (raw.statusCode == 200) {
      // print(raw.body);
      return raw;
    } else if (raw.statusCode == 400) {
      final parsed = raw.body;
      // print(raw.body);

      throw parsed["message"];
    } else {
      throw "Problema de conexión con el origen de datos";
    }
  }

  Future<Response> updateStateOrder(
      {required String token, required String id, required int code}) async {
    Map<String, String> headers = {"Authorization": "Bearer $token"};
    // print(code);
    // print(id);
    Map<String, dynamic> rawbody = {"id": id, "state": code};
    final raw = await put(
            "$baseUrl/api/v1/order/state/update", jsonEncode(rawbody),
            headers: headers)
        .timeout(const Duration(milliseconds: 8000));
    if (raw.statusCode == 200) {
      // print(raw.body);
      return raw;
    } else if (raw.statusCode == 400) {
      final parsed = raw.body;
      // print(parsed);

      throw parsed["message"];
    } else {
      throw "Problema de conexión con el origen de datos";
    }
  }

  Future<Response> getOrderById(
      {required String token, required String id}) async {
    Map<String, String> headers = {"Authorization": "Bearer $token"};

    final raw = await get("$baseUrl/api/v1/unit/order?id=$id", headers: headers)
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
