import 'package:json_annotation/json_annotation.dart';

part 'searchpictaobao.g.dart';

@JsonSerializable()
class SearchPicTaobao {
  final String? title;
  final String? pic_url;
  final int? price;
  final int? promotion_price;
  final String? num_iid;
  final String? detail_url;
  final String? is_tmail;
  final String? area;
  final String? nick;


  SearchPicTaobao(
    this.detail_url,
    this.num_iid,
    this.pic_url,
    this.price,
    this.promotion_price,
    this.title,
    this.area,
    this.is_tmail,
    this.nick
  );

  factory SearchPicTaobao.fromJson(Map<String, dynamic> json) => _$SearchPicTaobaoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPicTaobaoToJson(this);
}
