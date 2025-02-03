import 'package:cargoshipping/models/sku1688.dart';
import 'package:json_annotation/json_annotation.dart';

part 'skus1688.g.dart';

@JsonSerializable()
class Skus1688 {
  final List<Sku1688>? sku;

  Skus1688(
    this.sku,
  );

  factory Skus1688.fromJson(Map<String, dynamic> json) => _$Skus1688FromJson(json);

  Map<String, dynamic> toJson() => _$Skus1688ToJson(this);
}
