// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      json['title'] as String?,
      json['detail_url'] as String?,
      json['num_iid'] as String?,
      json['orginal_price'] as String?,
      json['pic_url'] as String?,
      json['price'] as String?,
      json['promotion_price'] as String?,
      (json['sales'] as num?)?.toInt(),
      json['seller_id'] as String?,
      json['seller_nick'] as String?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'title': instance.title,
      'pic_url': instance.pic_url,
      'promotion_price': instance.promotion_price,
      'orginal_price': instance.orginal_price,
      'price': instance.price,
      'sales': instance.sales,
      'seller_nick': instance.seller_nick,
      'seller_id': instance.seller_id,
      'detail_url': instance.detail_url,
      'num_iid': instance.num_iid,
    };
