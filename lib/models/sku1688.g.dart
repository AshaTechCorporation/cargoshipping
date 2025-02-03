// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sku1688.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sku1688 _$Sku1688FromJson(Map<String, dynamic> json) => Sku1688(
      (json['price'] as num?)?.toDouble(),
      (json['total_price'] as num?)?.toDouble(),
      (json['orginal_price'] as num?)?.toDouble(),
      json['properties'] as String?,
      json['properties_name'] as String?,
      (json['quantity'] as num?)?.toInt(),
      (json['sku_id'] as num?)?.toInt(),
      json['onepiece_price'] as String?,
      json['spec_id'] as String?,
    );

Map<String, dynamic> _$Sku1688ToJson(Sku1688 instance) => <String, dynamic>{
      'price': instance.price,
      'total_price': instance.total_price,
      'orginal_price': instance.orginal_price,
      'onepiece_price': instance.onepiece_price,
      'properties': instance.properties,
      'properties_name': instance.properties_name,
      'quantity': instance.quantity,
      'sku_id': instance.sku_id,
      'spec_id': instance.spec_id,
    };
