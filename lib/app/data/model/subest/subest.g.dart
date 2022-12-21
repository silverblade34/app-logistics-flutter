// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubEst _$SubEstFromJson(Map<String, dynamic> json) => SubEst(
      message: json['message'] as String,
      status: json['status'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => SubEstData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubEstToJson(SubEst instance) => <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
