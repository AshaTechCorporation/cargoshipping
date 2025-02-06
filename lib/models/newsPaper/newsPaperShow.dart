import 'package:cargoshipping/models/newsPaper/newsPaper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'newsPaperShow.g.dart';

@JsonSerializable()
class NewsPaperShow {
  int? id;
  String? name;
  String? prefix;
  List<NewsPaper>? news;
  List<NewsPaper>? manuals;

  NewsPaperShow(
    this.id,
    this.name,
    this.prefix,
    this.news,
    this.manuals,
  );

  factory NewsPaperShow.fromJson(Map<String, dynamic> json) => _$NewsPaperShowFromJson(json);

  Map<String, dynamic> toJson() => _$NewsPaperShowToJson(this);
}
