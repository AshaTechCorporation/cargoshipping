
import 'package:cargoshipping/models/problembodies.dart';
import 'package:json_annotation/json_annotation.dart';

part 'problemtype.g.dart';

@JsonSerializable()
class ProblemType {
  final int id;
  final String title;
  List<Problembodies>? problem_bodies;

  ProblemType(
    this.id,
    this.title,
    this.problem_bodies
  );

  factory ProblemType.fromJson(Map<String, dynamic> json) => _$ProblemTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ProblemTypeToJson(this);
}
