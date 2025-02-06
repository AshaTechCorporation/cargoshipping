import 'package:cargoshipping/models/newsPaper/newsPaper.dart';
import 'package:cargoshipping/models/serviceTransporterById.dart';
import 'package:json_annotation/json_annotation.dart';

part 'serviceTransporter.g.dart';

@JsonSerializable()
class ServiceTransporter {
  int? id;
  String? code;
  String? name;
  String? description;
  String? image;
  String? remark;
  String? line;
  String? phone;
  String? address;
  String? prefix;
  String? taobao;
  String? one_six_eight_eight;
  // String? status;
  List<ServiceTransporterById>? images;
  List<ServiceTransporterById>? icons;
  List<ServiceTransporterById>? icon_boxs;

  ServiceTransporter(
    this.id,
    this.code,
    this.name,
    this.description,
    this.image,
    this.remark,
    this.line,
    this.phone,
    this.address,
    // this.status,
    this.images,
    this.icons,
    this.icon_boxs,
    this.one_six_eight_eight,
    this.prefix,
    this.taobao,
  );

  factory ServiceTransporter.fromJson(Map<String, dynamic> json) => _$ServiceTransporterFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceTransporterToJson(this);
}
