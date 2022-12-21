import 'package:json_annotation/json_annotation.dart';
part 'credential_data_state.g.dart';

@JsonSerializable()
class CredentialDataState {
  String key;
  String name;
  int ord;
  int finish;
  int panel;
  int code;

  CredentialDataState({
    required this.key,
    required this.name,
    required this.ord,
    required this.finish,
    required this.panel,
    required this.code,
  });

  factory CredentialDataState.fromJson(Map<String, dynamic> data) =>
      _$CredentialDataStateFromJson(data);

  Map<String, dynamic> toJson() => _$CredentialDataStateToJson(this);
}
