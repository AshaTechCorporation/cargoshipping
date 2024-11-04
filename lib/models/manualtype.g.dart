// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manualtype.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManualType _$ManualTypeFromJson(Map<String, dynamic> json) => ManualType(
      (json['id'] as num).toInt(),
      json['name'] as String?,
      (json['manuals'] as List<dynamic>?)
          ?.map((e) => Manual.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ManualTypeToJson(ManualType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'manuals': instance.manuals,
    };
