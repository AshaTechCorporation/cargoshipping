import 'package:json_annotation/json_annotation.dart';

part 'reportproblems.g.dart';

@JsonSerializable()
class ReportProblems {
  final int id;
  final int problem_types_id;
  final String title;
  final String body;
  final String? officer_response;
  final DateTime createdAt;
  final DateTime updatedAt;

  ReportProblems({
    required this.id,
    required this.problem_types_id,
    required this.title,
    required this.body,
    required this.officer_response,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ReportProblems.fromJson(Map<String, dynamic> json) => _$ReportProblemsFromJson(json);

  Map<String, dynamic> toJson() => _$ReportProblemsToJson(this);
}
