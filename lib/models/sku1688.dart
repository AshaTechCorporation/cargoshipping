import 'package:json_annotation/json_annotation.dart';

part 'sku1688.g.dart';

@JsonSerializable()
class Sku1688 {
  final double? price;
  final double? total_price;
  final double? orginal_price;
  final String? onepiece_price;
  final String? properties;
  final String? properties_name;
  final int? quantity;
  final int? sku_id;
  final String? spec_id;

  Sku1688(
    this.price,
    this.total_price,
    this.orginal_price,
    this.properties,
    this.properties_name,
    this.quantity,
    this.sku_id,
    this.onepiece_price,
    this.spec_id
  );

  factory Sku1688.fromJson(Map<String, dynamic> json) => _$Sku1688FromJson(json);

  Map<String, dynamic> toJson() => _$Sku1688ToJson(this);
}
