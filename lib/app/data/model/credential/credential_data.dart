import 'package:json_annotation/json_annotation.dart';
import 'package:logis02app/app/data/model/credential/credential_data_state.dart';
part 'credential_data.g.dart';

@JsonSerializable(explicitToJson: true)
class CredentialData {
  String bearer_token;
  String document;
  String id;
  String movil;
  String name;
  String unit;
  List<CredentialDataState> states;

  CredentialData(
      {required this.bearer_token,
      required this.document,
      required this.id,
      required this.movil,
      required this.name,
      required this.unit,
      required this.states});

  factory CredentialData.fromJson(Map<String, dynamic> data) =>
      _$CredentialDataFromJson(data);

  Map<String, dynamic> toJson() => _$CredentialDataToJson(this);
}
