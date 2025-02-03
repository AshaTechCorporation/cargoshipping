import 'package:cargoshipping/models/propimg.dart';
import 'package:json_annotation/json_annotation.dart';

part 'propimgs.g.dart';

@JsonSerializable()
class PropImgs {
  final List<PropImg>? prop_img;

  PropImgs(
    this.prop_img,
  );

  factory PropImgs.fromJson(Map<String, dynamic> json) => _$PropImgsFromJson(json);

  Map<String, dynamic> toJson() => _$PropImgsToJson(this);
}
