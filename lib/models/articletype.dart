
import 'package:cargoshipping/models/article.dart';
import 'package:json_annotation/json_annotation.dart';

part 'articletype.g.dart';

@JsonSerializable()
class ArticleType {
  final int id;
  final String? name;
  List<Article>? articles;

  ArticleType(
    this.id,
    this.name,
    this.articles
  );

  factory ArticleType.fromJson(Map<String, dynamic> json) => _$ArticleTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleTypeToJson(this);
}
