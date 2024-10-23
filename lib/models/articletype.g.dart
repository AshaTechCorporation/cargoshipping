// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articletype.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleType _$ArticleTypeFromJson(Map<String, dynamic> json) => ArticleType(
      (json['id'] as num).toInt(),
      json['name'] as String?,
      (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticleTypeToJson(ArticleType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'articles': instance.articles,
    };
