import 'package:json_annotation/json_annotation.dart';

part 'sku.g.dart';

@JsonSerializable()
class Sku {
  final double? price;
  final int? total_price;
  final int? orginal_price;
  final String? properties;
  final String? properties_name;
  final int? quantity;
  final String? sku_id;

  Sku(
    this.price,
    this.total_price,
    this.orginal_price,
    this.properties,
    this.properties_name,
    this.quantity,
    this.sku_id
  );

  factory Sku.fromJson(Map<String, dynamic> json) => _$SkuFromJson(json);

  Map<String, dynamic> toJson() => _$SkuToJson(this);
}
