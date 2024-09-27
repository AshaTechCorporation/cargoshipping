// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problembodies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Problembodies _$ProblembodiesFromJson(Map<String, dynamic> json) =>
    Problembodies(
      (json['id'] as num).toInt(),
      (json['problem_types_id'] as num).toInt(),
      json['body'] as String,
    );

Map<String, dynamic> _$ProblembodiesToJson(Problembodies instance) =>
    <String, dynamic>{
      'id': instance.id,
      'problem_types_id': instance.problem_types_id,
      'body': instance.body,
    };
