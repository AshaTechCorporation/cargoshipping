import 'package:cargoshipping/models/subcategories.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  final String? title;
  final String? pic_url;
  final String? promotion_price;
  final String? orginal_price;
  final String? price;
  final int? sales;
  final String? seller_nick;
  final String? seller_id;
  final String? detail_url;
  final String? num_iid;


  Item(
    this.title,
    this.detail_url,
    this.num_iid,
    this.orginal_price,
    this.pic_url,
    this.price,
    this.promotion_price,
    this.sales,
    this.seller_id,
    this.seller_nick,
  );

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
