// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skus1688.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Skus1688 _$Skus1688FromJson(Map<String, dynamic> json) => Skus1688(
      (json['sku'] as List<dynamic>?)
          ?.map((e) => Sku1688.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$Skus1688ToJson(Skus1688 instance) => <String, dynamic>{
      'sku': instance.sku,
    };
