import 'package:cargoshipping/models/propimgs.dart';
import 'package:cargoshipping/models/props.dart';
import 'package:cargoshipping/models/skus1688.dart';
import 'package:json_annotation/json_annotation.dart';

part 'itemt1688.g.dart';

@JsonSerializable()
class Itemt1688 {
  final int? num_iid;
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
  final int? rootCatId;
  final int? cid;
  final String? created_time;
  final String? modified_time;
  final String? delist_time;
  final String? desc;
  final List<String>? desc_img;
  final String? item_weight;
  final String? item_size;
  final String? location;
  final String? post_fee;
  final int? express_fee;
  final String? ems_fee;
  final String? shipping_to;
  final String? has_discount;
  final String? video;
  final String? is_virtual;
  final String? sample_id;
  final String? is_promotion;
  final String? props_name;
  final PropImgs? prop_imgs;
  final String? property_alias;
  final List<Props>? props;
  final int? total_sold;
  final Skus1688? skus;
  final int? seller_id;
  final int? sales;
  final String? shop_id;
  final String? format_check;


  Itemt1688(
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
    this.video,
    this.express_fee,
    this.post_fee,
    this.rootCatId,
    this.sales
  );

  factory Itemt1688.fromJson(Map<String, dynamic> json) => _$Itemt1688FromJson(json);

  Map<String, dynamic> toJson() => _$Itemt1688ToJson(this);
}
