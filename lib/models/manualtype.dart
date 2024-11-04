

import 'package:cargoshipping/models/manual.dart';
import 'package:json_annotation/json_annotation.dart';

part 'manualtype.g.dart';

@JsonSerializable()
class ManualType {
  final int id;
  final String? name;
  List<Manual>? manuals;

  ManualType(
    this.id,
    this.name,
    this.manuals
  );

  factory ManualType.fromJson(Map<String, dynamic> json) => _$ManualTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ManualTypeToJson(this);
}
