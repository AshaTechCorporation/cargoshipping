// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemimage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemImage _$ItemImageFromJson(Map<String, dynamic> json) => ItemImage(
      json['file_url'] as String?,
      json['name'] as String?,
      json['status'] as String?,
      json['url'] as String?,
    );

Map<String, dynamic> _$ItemImageToJson(ItemImage instance) => <String, dynamic>{
      'name': instance.name,
      'file_url': instance.file_url,
      'status': instance.status,
      'url': instance.url,
    };
