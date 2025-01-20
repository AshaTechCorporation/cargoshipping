// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searchpictaobao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPicTaobao _$SearchPicTaobaoFromJson(Map<String, dynamic> json) =>
    SearchPicTaobao(
      json['detail_url'] as String?,
      json['num_iid'] as String?,
      json['pic_url'] as String?,
      (json['price'] as num?)?.toInt(),
      (json['promotion_price'] as num?)?.toInt(),
      json['title'] as String?,
      json['area'] as String?,
      json['is_tmail'] as String?,
      json['nick'] as String?,
    );

Map<String, dynamic> _$SearchPicTaobaoToJson(SearchPicTaobao instance) =>
    <String, dynamic>{
      'title': instance.title,
      'pic_url': instance.pic_url,
      'price': instance.price,
      'promotion_price': instance.promotion_price,
      'num_iid': instance.num_iid,
      'detail_url': instance.detail_url,
      'is_tmail': instance.is_tmail,
      'area': instance.area,
      'nick': instance.nick,
    };
