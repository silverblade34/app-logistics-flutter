import 'package:json_annotation/json_annotation.dart';
part 'order_data.g.dart';

@JsonSerializable()
class OrderData {
  String codClient;
  String name;
  String direction;
  String date;
  String nReferencia;
  String nameClient;
  String id;
  int finish;
  int ord;
  int code;

  OrderData({
    required this.codClient,
    required this.name,
    required this.direction,
    required this.date,
    required this.nReferencia,
    required this.nameClient,
    required this.finish,
    required this.id,
    required this.ord,
    required this.code,
  });

  factory OrderData.fromJson(Map<String, dynamic> data) =>
      _$OrderDataFromJson(data);

  Map<String, dynamic> toJson() => _$OrderDataToJson(this);
}
