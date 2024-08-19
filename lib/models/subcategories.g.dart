// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategories _$SubCategoriesFromJson(Map<String, dynamic> json) =>
    SubCategories(
      json['name'] as String?,
      (json['items'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SubCategoriesToJson(SubCategories instance) =>
    <String, dynamic>{
      'name': instance.name,
      'items': instance.items,
    };
