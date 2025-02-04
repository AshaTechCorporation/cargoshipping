// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serviceTransporter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceTransporter _$ServiceTransporterFromJson(Map<String, dynamic> json) =>
    ServiceTransporter(
      (json['id'] as num?)?.toInt(),
      json['code'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      json['image'] as String?,
      json['line'] as String?,
      json['phone'] as String?,
      json['address'] as String?,
      json['status'] as String?,
    );

Map<String, dynamic> _$ServiceTransporterToJson(ServiceTransporter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'line': instance.line,
      'phone': instance.phone,
      'address': instance.address,
      'status': instance.status,
    };
