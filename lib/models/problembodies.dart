
import 'package:json_annotation/json_annotation.dart';

part 'problembodies.g.dart';

@JsonSerializable()
class Problembodies {
  final int id;
  final int problem_types_id;
  final String body;

  Problembodies(
    this.id,
    this.problem_types_id,
    this.body,

  );

  factory Problembodies.fromJson(Map<String, dynamic> json) => _$ProblembodiesFromJson(json);

  Map<String, dynamic> toJson() => _$ProblembodiesToJson(this);
}
