// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searchpic1688.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPic1688 _$SearchPic1688FromJson(Map<String, dynamic> json) =>
    SearchPic1688(
      json['detail_url'] as String?,
      (json['num_iid'] as num?)?.toInt(),
      json['pic_url'] as String?,
      json['price'] as String?,
      json['promotion_price'] as String?,
      (json['sales'] as num?)?.toInt(),
      json['title'] as String?,
      json['turn_head'] as String?,
    );

Map<String, dynamic> _$SearchPic1688ToJson(SearchPic1688 instance) =>
    <String, dynamic>{
      'title': instance.title,
      'pic_url': instance.pic_url,
      'promotion_price': instance.promotion_price,
      'price': instance.price,
      'sales': instance.sales,
      'num_iid': instance.num_iid,
      'turn_head': instance.turn_head,
      'detail_url': instance.detail_url,
    };
