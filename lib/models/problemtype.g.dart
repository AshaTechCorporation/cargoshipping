// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problemtype.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProblemType _$ProblemTypeFromJson(Map<String, dynamic> json) => ProblemType(
      (json['id'] as num).toInt(),
      json['title'] as String,
      (json['problem_bodies'] as List<dynamic>?)
          ?.map((e) => Problembodies.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProblemTypeToJson(ProblemType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'problem_bodies': instance.problem_bodies,
    };
