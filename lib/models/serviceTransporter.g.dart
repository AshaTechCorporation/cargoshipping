// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serviceTransporter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceTransporter _$ServiceTransporterFromJson(Map<String, dynamic> json) => ServiceTransporter(
      (json['id'] as num?)?.toInt(),
      json['code'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      json['image'] as String?,
      json['remark'] as String?,
      json['line'] as String?,
      json['phone'] as String?,
      json['address'] as String?,
      (json['images'] as List<dynamic>?)?.map((e) => ServiceTransporterById.fromJson(e as Map<String, dynamic>)).toList(),
      (json['icons'] as List<dynamic>?)?.map((e) => ServiceTransporterById.fromJson(e as Map<String, dynamic>)).toList(),
      (json['icon_boxs'] as List<dynamic>?)?.map((e) => ServiceTransporterById.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$ServiceTransporterToJson(ServiceTransporter instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'remark': instance.remark,
      'line': instance.line,
      'phone': instance.phone,
      'address': instance.address,
      'images': instance.images,
      'icons': instance.icons,
      'icon_boxs': instance.icon_boxs,
    };
