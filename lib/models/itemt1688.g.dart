// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemt1688.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Itemt1688 _$Itemt1688FromJson(Map<String, dynamic> json) => Itemt1688(
      json['brand'] as String?,
      (json['cid'] as num?)?.toInt(),
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
      (json['num_iid'] as num?)?.toInt(),
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
      json['props_name'] as String?,
      json['sample_id'] as String?,
      (json['seller_id'] as num?)?.toInt(),
      json['shipping_to'] as String?,
      json['shop_id'] as String?,
      json['skus'] == null
          ? null
          : Skus1688.fromJson(json['skus'] as Map<String, dynamic>),
      (json['suggestive_price'] as num?)?.toDouble(),
      json['title'] as String?,
      (json['total_price'] as num?)?.toDouble(),
      (json['total_sold'] as num?)?.toInt(),
      json['video'] as String?,
      (json['express_fee'] as num?)?.toInt(),
      json['post_fee'] as String?,
      (json['rootCatId'] as num?)?.toInt(),
      (json['sales'] as num?)?.toInt(),
      (json['item_imgs'] as List<dynamic>?)
          ?.map((e) => ItemImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$Itemt1688ToJson(Itemt1688 instance) => <String, dynamic>{
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
      'rootCatId': instance.rootCatId,
      'cid': instance.cid,
      'created_time': instance.created_time,
      'modified_time': instance.modified_time,
      'delist_time': instance.delist_time,
      'desc': instance.desc,
      'desc_img': instance.desc_img,
      'item_weight': instance.item_weight,
      'item_size': instance.item_size,
      'location': instance.location,
      'post_fee': instance.post_fee,
      'express_fee': instance.express_fee,
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
      'sales': instance.sales,
      'shop_id': instance.shop_id,
      'format_check': instance.format_check,
      'item_imgs': instance.item_imgs,
    };
