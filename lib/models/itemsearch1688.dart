import 'package:json_annotation/json_annotation.dart';

part 'itemsearch1688.g.dart';

@JsonSerializable()
class ItemSearch1688 {
  final String? title;
  final String? pic_url;
  final String? price;
  final String? promotion_price;
  final String? tag_percent;
  final int? sales;  
  final int? num_iid;
  final String? seller_id;
  final String? detail_url;


  ItemSearch1688(
    this.detail_url,
    this.num_iid,
    this.pic_url,
    this.price,
    this.promotion_price,
    this.sales,
    this.title,
    this.tag_percent,
    this.seller_id
  );

  factory ItemSearch1688.fromJson(Map<String, dynamic> json) => _$ItemSearch1688FromJson(json);

  Map<String, dynamic> toJson() => _$ItemSearch1688ToJson(this);
}
