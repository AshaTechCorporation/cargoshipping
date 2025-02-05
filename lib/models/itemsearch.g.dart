// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemsearch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemSearch _$ItemSearchFromJson(Map<String, dynamic> json) => ItemSearch(
      json['detail_url'] as String?,
      json['num_iid'] as String?,
      json['pic_url'] as String?,
      json['price'] as String?,
      json['promotion_price'] as String?,
      (json['sales'] as num?)?.toInt(),
      json['title'] as String?,
      json['orginal_price'] as String?,
      json['seller_id'] as String?,
    );

Map<String, dynamic> _$ItemSearchToJson(ItemSearch instance) =>
    <String, dynamic>{
      'title': instance.title,
      'pic_url': instance.pic_url,
      'price': instance.price,
      'promotion_price': instance.promotion_price,
      'orginal_price': instance.orginal_price,
      'sales': instance.sales,
      'num_iid': instance.num_iid,
      'seller_id': instance.seller_id,
      'detail_url': instance.detail_url,
    };
