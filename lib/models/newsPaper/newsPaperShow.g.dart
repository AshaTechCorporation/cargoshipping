// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsPaperShow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsPaperShow _$NewsPaperShowFromJson(Map<String, dynamic> json) =>
    NewsPaperShow(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['prefix'] as String?,
      (json['news'] as List<dynamic>?)
          ?.map((e) => NewsPaper.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['manuals'] as List<dynamic>?)
          ?.map((e) => NewsPaper.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsPaperShowToJson(NewsPaperShow instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'prefix': instance.prefix,
      'news': instance.news,
      'manuals': instance.manuals,
    };
