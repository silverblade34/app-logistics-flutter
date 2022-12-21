import 'package:logis02app/app/data/model/order/order.dart';
import 'package:logis02app/app/data/model/order/order_data.dart';
import 'package:logis02app/app/data/provider/orders_provider.dart';

class OrdersRepository {
  OrdersApi api = OrdersApi();

  Future<Order> getOrders(
      {required String token, required String plate}) async {
    final raw = await api.getOrders(token: token, plate: plate);
    final body = raw.body;
    final order = Order.fromJson(body);
    // print(body);
    return order;
  }

  Future<void> updateStateOrder(
      {required String token, required String id, required int code}) async {
    final raw = await api.updateStateOrder(token: token, id: id, code: code);
    final body = raw.body;
    // print(body);
  }

  Future<OrderData> getOrderById(
      {required String token, required String id}) async {
    final raw = await api.getOrderById(token: token, id: id);
    final body = raw.body["data"];
    final order = OrderData.fromJson(body);

    return order;
  }
}
