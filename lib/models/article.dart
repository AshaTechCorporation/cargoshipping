
import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  final int id;
  final int article_type_id;
  final String? title;
  final String? content;
  final String? status;
  final DateTime? created_at;
  final DateTime? updated_at;
  final String? photo_title_url;
  final String? photo_content_url;

  Article(
    this.id,
    this.title,
    this.article_type_id,
    this.content,
    this.status,
    this.created_at,
    this.updated_at,
    this.photo_content_url,
    this.photo_title_url
  );

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
