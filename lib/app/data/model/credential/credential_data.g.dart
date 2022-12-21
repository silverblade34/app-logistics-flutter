// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CredentialData _$CredentialDataFromJson(Map<String, dynamic> json) =>
    CredentialData(
      bearer_token: json['bearer_token'] as String,
      document: json['document'] as String,
      id: json['id'] as String,
      movil: json['movil'] as String,
      name: json['name'] as String,
      unit: json['unit'] as String,
      states: (json['states'] as List<dynamic>)
          .map((e) => CredentialDataState.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CredentialDataToJson(CredentialData instance) =>
    <String, dynamic>{
      'bearer_token': instance.bearer_token,
      'document': instance.document,
      'id': instance.id,
      'movil': instance.movil,
      'name': instance.name,
      'unit': instance.unit,
      'states': instance.states.map((e) => e.toJson()).toList(),
    };
