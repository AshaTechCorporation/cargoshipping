import 'package:json_annotation/json_annotation.dart';

part 'propimg.g.dart';

@JsonSerializable()
class PropImg {
  final String? properties;
  final String? url;

  PropImg(
    this.properties,
    this.url
  );

  factory PropImg.fromJson(Map<String, dynamic> json) => _$PropImgFromJson(json);

  Map<String, dynamic> toJson() => _$PropImgToJson(this);
}
