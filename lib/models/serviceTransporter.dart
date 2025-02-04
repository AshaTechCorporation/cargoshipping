import 'package:json_annotation/json_annotation.dart';

part 'serviceTransporter.g.dart';

@JsonSerializable()
class ServiceTransporter {
  int? id;
  String? code;
  String? name;
  String? description;
  String? image;
  String? line;
  String? phone;
  String? address;
  String? status;

  ServiceTransporter(
    this.id,
    this.code,
    this.name,
    this.description,
    this.image,
    this.line,
    this.phone,
    this.address,
    this.status,
  );

  factory ServiceTransporter.fromJson(Map<String, dynamic> json) => _$ServiceTransporterFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceTransporterToJson(this);
}
