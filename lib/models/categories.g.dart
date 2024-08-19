// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      json['name'] as String?,
      (json['subcategories'] as List<dynamic>?)
          ?.map((e) => SubCategories.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'name': instance.name,
      'subcategories': instance.subcategories,
    };
