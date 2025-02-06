import 'package:json_annotation/json_annotation.dart';

part 'newsPaper.g.dart';

@JsonSerializable()
class NewsPaper {
  int? id;
  String? code;
  int? category_newss_id;
  int? category_member_manual_id;
  String? name;
  String? description;
  // String? image;
  DateTime? created_at;

  NewsPaper(
    this.id,
    this.code,
    this.category_newss_id,
    this.category_member_manual_id,
    this.name,
    this.description,
    // this.image,
    this.created_at,
  );

  factory NewsPaper.fromJson(Map<String, dynamic> json) => _$NewsPaperFromJson(json);

  Map<String, dynamic> toJson() => _$NewsPaperToJson(this);
}
