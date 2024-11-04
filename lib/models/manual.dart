
import 'package:json_annotation/json_annotation.dart';

part 'manual.g.dart';

@JsonSerializable()
class Manual {
  final int id;
  final int manual_type_id;
  final String? title;
  final String? content;
  final String? status;
  final DateTime? created_at;
  final DateTime? updated_at;
  final String? photo_title_url;
  final String? photo_content_url;

  Manual(
    this.content,
    this.created_at,
    this.id,
    this.manual_type_id,
    this.photo_content_url,
    this.photo_title_url,
    this.status,
    this.title,
    this.updated_at
  );

  factory Manual.fromJson(Map<String, dynamic> json) => _$ManualFromJson(json);

  Map<String, dynamic> toJson() => _$ManualToJson(this);
}
