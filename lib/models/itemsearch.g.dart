// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemsearch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemSearch _$ItemSearchFromJson(Map<String, dynamic> json) => ItemSearch(
      json['detail_url'] as String?,
      (json['num_iid'] as num?)?.toInt(),
      json['pic_url'] as String?,
      json['price'] as String?,
      json['promotion_price'] as String?,
      (json['sales'] as num?)?.toInt(),
      json['tag_percent'] as String?,
      json['title'] as String?,
    );

Map<String, dynamic> _$ItemSearchToJson(ItemSearch instance) =>
    <String, dynamic>{
      'title': instance.title,
      'pic_url': instance.pic_url,
      'price': instance.price,
      'promotion_price': instance.promotion_price,
      'sales': instance.sales,
      'num_iid': instance.num_iid,
      'tag_percent': instance.tag_percent,
      'detail_url': instance.detail_url,
    };
