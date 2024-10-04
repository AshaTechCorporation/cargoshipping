// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reportproblems.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportProblems _$ReportProblemsFromJson(Map<String, dynamic> json) =>
    ReportProblems(
      id: (json['id'] as num).toInt(),
      problem_types_id: (json['problem_types_id'] as num?)?.toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
      officer_response: json['officer_response'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ReportProblemsToJson(ReportProblems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'problem_types_id': instance.problem_types_id,
      'title': instance.title,
      'body': instance.body,
      'officer_response': instance.officer_response,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
