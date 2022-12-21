// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      message: json['message'] as String,
      status: json['status'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => OrderData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
