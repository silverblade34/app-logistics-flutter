import 'package:json_annotation/json_annotation.dart';
import 'subest_data.dart';
part 'subest.g.dart';

@JsonSerializable(explicitToJson: true)
class SubEst {
  String message;
  bool status;
  List<SubEstData> data;

  SubEst({
    required this.message,
    required this.status,
    required this.data,
  });

  factory SubEst.fromJson(Map<String, dynamic> data) => _$SubEstFromJson(data);

  Map<String, dynamic> toJson() => _$SubEstToJson(this);
}
