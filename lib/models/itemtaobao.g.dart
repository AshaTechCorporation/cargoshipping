// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemtaobao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemTaobao _$ItemTaobaoFromJson(Map<String, dynamic> json) => ItemTaobao(
      json['brand'] as String?,
      json['cid'] as String?,
      json['created_time'] as String?,
      json['delist_time'] as String?,
      json['desc'] as String?,
      (json['desc_img'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['desc_short'] as String?,
      json['detail_url'] as String?,
      json['ems_fee'] as String?,
      json['format_check'] as String?,
      json['has_discount'] as String?,
      json['is_promotion'] as String?,
      json['is_virtual'] as String?,
      json['item_size'] as String?,
      json['item_weight'] as String?,
      json['location'] as String?,
      json['min_num'] as String?,
      json['modified_time'] as String?,
      json['nick'] as String?,
      (json['num'] as num?)?.toInt(),
      json['num_iid'] as String?,
      (json['orginal_price'] as num?)?.toDouble(),
      json['pic_url'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['prop_imgs'] == null
          ? null
          : PropImgs.fromJson(json['prop_imgs'] as Map<String, dynamic>),
      json['property_alias'] as String?,
      (json['props'] as List<dynamic>?)
          ?.map((e) => Props.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['props_imgs'] as List<dynamic>?)
          ?.map((e) => PropImgs.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['props_name'] as String?,
      json['sample_id'] as String?,
      (json['seller_id'] as num?)?.toInt(),
      json['shipping_to'] as String?,
      json['shop_id'] as String?,
      json['skus'] == null
          ? null
          : Skus.fromJson(json['skus'] as Map<String, dynamic>),
      (json['suggestive_price'] as num?)?.toDouble(),
      json['title'] as String?,
      (json['total_price'] as num?)?.toDouble(),
      json['total_sold'] as String?,
      json['video'] == null
          ? null
          : Video.fromJson(json['video'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemTaobaoToJson(ItemTaobao instance) =>
    <String, dynamic>{
      'num_iid': instance.num_iid,
      'title': instance.title,
      'desc_short': instance.desc_short,
      'price': instance.price,
      'total_price': instance.total_price,
      'suggestive_price': instance.suggestive_price,
      'orginal_price': instance.orginal_price,
      'nick': instance.nick,
      'num': instance.num,
      'min_num': instance.min_num,
      'detail_url': instance.detail_url,
      'pic_url': instance.pic_url,
      'brand': instance.brand,
      'cid': instance.cid,
      'created_time': instance.created_time,
      'modified_time': instance.modified_time,
      'delist_time': instance.delist_time,
      'desc': instance.desc,
      'desc_img': instance.desc_img,
      'item_weight': instance.item_weight,
      'item_size': instance.item_size,
      'location': instance.location,
      'ems_fee': instance.ems_fee,
      'shipping_to': instance.shipping_to,
      'has_discount': instance.has_discount,
      'video': instance.video,
      'is_virtual': instance.is_virtual,
      'sample_id': instance.sample_id,
      'is_promotion': instance.is_promotion,
      'props_name': instance.props_name,
      'prop_imgs': instance.prop_imgs,
      'property_alias': instance.property_alias,
      'props': instance.props,
      'total_sold': instance.total_sold,
      'skus': instance.skus,
      'seller_id': instance.seller_id,
      'shop_id': instance.shop_id,
      'props_imgs': instance.props_imgs,
      'format_check': instance.format_check,
    };
