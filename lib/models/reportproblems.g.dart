// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reportproblems.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportProblems _$ReportProblemsFromJson(Map<String, dynamic> json) =>
    ReportProblems(
      id: (json['id'] as num).toInt(),
      problem_types_id: (json['problem_types_id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
      officer_response: json['officer_response'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ReportProblemsToJson(ReportProblems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'problem_types_id': instance.problem_types_id,
      'title': instance.title,
      'body': instance.body,
      'officer_response': instance.officer_response,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
