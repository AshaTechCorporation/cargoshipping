// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      (json['id'] as num).toInt(),
      json['title'] as String?,
      (json['article_type_id'] as num).toInt(),
      json['content'] as String?,
      json['status'] as String?,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'article_type_id': instance.article_type_id,
      'title': instance.title,
      'content': instance.content,
      'status': instance.status,
    };
