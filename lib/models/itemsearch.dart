import 'package:json_annotation/json_annotation.dart';

part 'itemsearch.g.dart';

@JsonSerializable()
class ItemSearch {
  final String? title;
  final String? pic_url;
  final int? price;
  final int? promotion_price;
  final int? orginal_price;
  final int? sales;  
  final String? num_iid;
  final String? seller_id;
  final String? detail_url;


  ItemSearch(
    this.detail_url,
    this.num_iid,
    this.pic_url,
    this.price,
    this.promotion_price,
    this.sales,
    this.title,
    this.orginal_price,
    this.seller_id
  );

  factory ItemSearch.fromJson(Map<String, dynamic> json) => _$ItemSearchFromJson(json);

  Map<String, dynamic> toJson() => _$ItemSearchToJson(this);
}
