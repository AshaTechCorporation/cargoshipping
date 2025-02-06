// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orders _$OrdersFromJson(Map<String, dynamic> json) => Orders(
      json['date'] as String?,
      (json['total_price'] as num?)?.toInt(),
      json['member_id'] as String?,
      json['member_address_id'] as String?,
      json['shipping_type'] as String?,
      json['payment_term'] as String?,
      json['note'] as String?,
      (json['products'] as List<dynamic>?)
          ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['options'] as List<dynamic>?)
          ?.map((e) => OptionsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      'date': instance.date,
      'total_price': instance.total_price,
      'member_id': instance.member_id,
      'member_address_id': instance.member_address_id,
      'shipping_type': instance.shipping_type,
      'payment_term': instance.payment_term,
      'note': instance.note,
      'products': instance.products,
      'options': instance.options,
    };
