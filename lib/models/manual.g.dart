// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manual.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Manual _$ManualFromJson(Map<String, dynamic> json) => Manual(
      json['content'] as String?,
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      (json['id'] as num).toInt(),
      (json['manual_type_id'] as num).toInt(),
      json['photo_content_url'] as String?,
      json['photo_title_url'] as String?,
      json['status'] as String?,
      json['title'] as String?,
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ManualToJson(Manual instance) => <String, dynamic>{
      'id': instance.id,
      'manual_type_id': instance.manual_type_id,
      'title': instance.title,
      'content': instance.content,
      'status': instance.status,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'photo_title_url': instance.photo_title_url,
      'photo_content_url': instance.photo_content_url,
    };
