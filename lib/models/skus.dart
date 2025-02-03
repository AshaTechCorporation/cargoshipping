import 'package:cargoshipping/models/sku.dart';
import 'package:json_annotation/json_annotation.dart';

part 'skus.g.dart';

@JsonSerializable()
class Skus {
  final List<Sku>? sku;

  Skus(
    this.sku,
  );

  factory Skus.fromJson(Map<String, dynamic> json) => _$SkusFromJson(json);

  Map<String, dynamic> toJson() => _$SkusToJson(this);
}
