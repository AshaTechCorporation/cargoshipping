// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemsearch1688.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemSearch1688 _$ItemSearch1688FromJson(Map<String, dynamic> json) =>
    ItemSearch1688(
      json['detail_url'] as String?,
      (json['num_iid'] as num?)?.toInt(),
      json['pic_url'] as String?,
      json['price'] as String?,
      json['promotion_price'] as String?,
      (json['sales'] as num?)?.toInt(),
      json['title'] as String?,
      json['tag_percent'] as String?,
      json['seller_id'] as String?,
    );

Map<String, dynamic> _$ItemSearch1688ToJson(ItemSearch1688 instance) =>
    <String, dynamic>{
      'title': instance.title,
      'pic_url': instance.pic_url,
      'price': instance.price,
      'promotion_price': instance.promotion_price,
      'tag_percent': instance.tag_percent,
      'sales': instance.sales,
      'num_iid': instance.num_iid,
      'seller_id': instance.seller_id,
      'detail_url': instance.detail_url,
    };
