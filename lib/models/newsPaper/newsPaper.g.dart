// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsPaper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsPaper _$NewsPaperFromJson(Map<String, dynamic> json) => NewsPaper(
      (json['id'] as num?)?.toInt(),
      json['code'] as String?,
      (json['category_newss_id'] as num?)?.toInt(),
      (json['category_member_manual_id'] as num?)?.toInt(),
      json['name'] as String?,
      json['description'] as String?,
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$NewsPaperToJson(NewsPaper instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'category_newss_id': instance.category_newss_id,
      'category_member_manual_id': instance.category_member_manual_id,
      'name': instance.name,
      'description': instance.description,
      'created_at': instance.created_at?.toIso8601String(),
    };
