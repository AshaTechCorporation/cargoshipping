// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sku.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sku _$SkuFromJson(Map<String, dynamic> json) => Sku(
      (json['price'] as num?)?.toDouble(),
      (json['total_price'] as num?)?.toInt(),
      (json['orginal_price'] as num?)?.toInt(),
      json['properties'] as String?,
      json['properties_name'] as String?,
      (json['quantity'] as num?)?.toInt(),
      json['sku_id'] as String?,
    );

Map<String, dynamic> _$SkuToJson(Sku instance) => <String, dynamic>{
      'price': instance.price,
      'total_price': instance.total_price,
      'orginal_price': instance.orginal_price,
      'properties': instance.properties,
      'properties_name': instance.properties_name,
      'quantity': instance.quantity,
      'sku_id': instance.sku_id,
    };
