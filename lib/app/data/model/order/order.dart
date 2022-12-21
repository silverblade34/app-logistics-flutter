import 'package:json_annotation/json_annotation.dart';
import 'order_data.dart';
part 'order.g.dart';

@JsonSerializable(explicitToJson: true)
class Order {
  String message;
  bool status;
  List<OrderData> data;

  Order({
    required this.message,
    required this.status,
    required this.data,
  });

  factory Order.fromJson(Map<String, dynamic> data) => _$OrderFromJson(data);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
