// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderData _$OrderDataFromJson(Map<String, dynamic> json) => OrderData(
      codClient: json['codClient'] as String,
      name: json['name'] as String,
      direction: json['direction'] as String,
      date: json['date'] as String,
      nReferencia: json['nReferencia'] as String,
      nameClient: json['nameClient'] as String,
      finish: json['finish'] as int,
      id: json['id'] as String,
      ord: json['ord'] as int,
      code: json['code'] as int,
    );

Map<String, dynamic> _$OrderDataToJson(OrderData instance) => <String, dynamic>{
      'codClient': instance.codClient,
      'name': instance.name,
      'direction': instance.direction,
      'date': instance.date,
      'nReferencia': instance.nReferencia,
      'nameClient': instance.nameClient,
      'id': instance.id,
      'finish': instance.finish,
      'ord': instance.ord,
      'code': instance.code,
    };
