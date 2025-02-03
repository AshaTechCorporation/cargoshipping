import 'package:json_annotation/json_annotation.dart';

part 'props.g.dart';

@JsonSerializable()
class Props {
  final String? name;
  final String? value;

  Props(
    this.name,
    this.value
  );

  factory Props.fromJson(Map<String, dynamic> json) => _$PropsFromJson(json);

  Map<String, dynamic> toJson() => _$PropsToJson(this);
}
