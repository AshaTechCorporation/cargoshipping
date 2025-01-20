import 'package:json_annotation/json_annotation.dart';

part 'searchpic1688.g.dart';

@JsonSerializable()
class SearchPic1688 {
  final String? title;
  final String? pic_url;
  final String? promotion_price;
  final String? price;
  final int? sales;
  final int? num_iid;
  final String? turn_head;
  final String? detail_url;


  SearchPic1688(
    this.detail_url,
    this.num_iid,
    this.pic_url,
    this.price,
    this.promotion_price,
    this.sales,
    this.title,
    this.turn_head,
  );

  factory SearchPic1688.fromJson(Map<String, dynamic> json) => _$SearchPic1688FromJson(json);

  Map<String, dynamic> toJson() => _$SearchPic1688ToJson(this);
}
