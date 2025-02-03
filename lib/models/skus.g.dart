// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Skus _$SkusFromJson(Map<String, dynamic> json) => Skus(
      (json['sku'] as List<dynamic>?)
          ?.map((e) => Sku.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SkusToJson(Skus instance) => <String, dynamic>{
      'sku': instance.sku,
    };
