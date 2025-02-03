import 'package:cargoshipping/models/propimgs.dart';
import 'package:cargoshipping/models/props.dart';
import 'package:cargoshipping/models/skus.dart';
import 'package:cargoshipping/models/video.dart';
import 'package:json_annotation/json_annotation.dart';

part 'itemtaobao.g.dart';

@JsonSerializable()
class ItemTaobao {
  final String? num_iid;
  final String? title;
  final String? desc_short;
  final double? price;
  final double? total_price;
  final double? suggestive_price;
  final double? orginal_price;
  final String? nick;
  final int? num;
  final String? min_num;
  final String? detail_url;
  final String? pic_url;
  final String? brand;
  final String? cid;
  final String? created_time;
  final String? modified_time;
  final String? delist_time;
  final String? desc;
  final List<String>? desc_img;
  final String? item_weight;
  final String? item_size;
  final String? location;
  final String? ems_fee;
  final String? shipping_to;
  final String? has_discount;
  final Video? video;
  final String? is_virtual;
  final String? sample_id;
  final String? is_promotion;
  final String? props_name;
  final PropImgs? prop_imgs;
  final String? property_alias;
  final List<Props>? props;
  final String? total_sold;
  final Skus? skus;
  final int? seller_id;
  final String? shop_id;
  final List<PropImgs>? props_imgs;
  final String? format_check;


  ItemTaobao(
    this.brand,
    this.cid,
    this.created_time,
    this.delist_time,
    this.desc,
    this.desc_img,
    this.desc_short,
    this.detail_url,
    this.ems_fee,
    this.format_check,
    this.has_discount,
    this.is_promotion,
    this.is_virtual,
    this.item_size,
    this.item_weight,
    this.location,
    this.min_num,
    this.modified_time,
    this.nick,
    this.num,
    this.num_iid,
    this.orginal_price,
    this.pic_url,
    this.price,
    this.prop_imgs,
    this.property_alias,
    this.props,
    this.props_imgs,
    this.props_name,
    this.sample_id,
    this.seller_id,
    this.shipping_to,
    this.shop_id,
    this.skus,
    this.suggestive_price,
    this.title,
    this.total_price,
    this.total_sold,
    this.video
  );

  factory ItemTaobao.fromJson(Map<String, dynamic> json) => _$ItemTaobaoFromJson(json);

  Map<String, dynamic> toJson() => _$ItemTaobaoToJson(this);
}
