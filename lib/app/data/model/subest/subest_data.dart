import 'package:json_annotation/json_annotation.dart';
part 'subest_data.g.dart';

@JsonSerializable()
class SubEstData {
  String id;
  String name;
  String visual;

  SubEstData({
    required this.id,
    required this.name,
    required this.visual,
  });

  factory SubEstData.fromJson(Map<String, dynamic> data) =>
      _$SubEstDataFromJson(data);

  Map<String, dynamic> toJson() => _$SubEstDataToJson(this);
}
