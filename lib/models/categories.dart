import 'package:cargoshipping/models/subcategories.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

@JsonSerializable()
class Categories {
  final String? name;
  final List<SubCategories>? subcategories;

  Categories(
    this.name,
    this.subcategories
  );

  factory Categories.fromJson(Map<String, dynamic> json) => _$CategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}
