import 'package:json_annotation/json_annotation.dart';

part 'itemsearch.g.dart';

@JsonSerializable()
class ItemSearch {
  final String? title;
  final String? pic_url;
  final String? price;
  final String? promotion_price;
  final int? sales;  
  final int? num_iid;
  final String? tag_percent;
  final String? detail_url;


  ItemSearch(
    this.detail_url,
    this.num_iid,
    this.pic_url,
    this.price,
    this.promotion_price,
    this.sales,
    this.tag_percent,
    this.title
  );

  factory ItemSearch.fromJson(Map<String, dynamic> json) => _$ItemSearchFromJson(json);

  Map<String, dynamic> toJson() => _$ItemSearchToJson(this);
}
