
import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  final int id;
  final int article_type_id;
  final String? title;
  final String? content;
  final String? status;

  Article(
    this.id,
    this.title,
    this.article_type_id,
    this.content,
    this.status
  );

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
