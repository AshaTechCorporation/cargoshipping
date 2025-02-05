import 'package:json_annotation/json_annotation.dart';

part 'itemimage.g.dart';

@JsonSerializable()
class ItemImage {
  final String? name;
  final String? file_url;
  final String? status;
  final String? url;

  ItemImage(this.file_url, this.name, this.status, this.url);

  factory ItemImage.fromJson(Map<String, dynamic> json) => _$ItemImageFromJson(json);

  Map<String, dynamic> toJson() => _$ItemImageToJson(this);
}
