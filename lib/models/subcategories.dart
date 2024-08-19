
import 'package:json_annotation/json_annotation.dart';

part 'subcategories.g.dart';

@JsonSerializable()
class SubCategories {
  final String? name;
  final List<String>? items;

  SubCategories(
    this.name,
    this.items
  );

  factory SubCategories.fromJson(Map<String, dynamic> json) => _$SubCategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoriesToJson(this);
}
