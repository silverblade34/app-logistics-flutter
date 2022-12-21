// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential_data_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CredentialDataState _$CredentialDataStateFromJson(Map<String, dynamic> json) =>
    CredentialDataState(
      key: json['key'] as String,
      name: json['name'] as String,
      ord: json['ord'] as int,
      finish: json['finish'] as int,
      panel: json['panel'] as int,
      code: json['code'] as int,
    );

Map<String, dynamic> _$CredentialDataStateToJson(
        CredentialDataState instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'ord': instance.ord,
      'finish': instance.finish,
      'panel': instance.panel,
      'code': instance.code,
    };
