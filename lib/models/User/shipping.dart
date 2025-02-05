import 'package:json_annotation/json_annotation.dart';

part 'shipping.g.dart';

@JsonSerializable()
class Shipping {
  int? id;
  String? code;
  int? member_id;
  String? address;
  String? province;
  String? district;
  String? sub_district;
  String? postal_code;
  String? latitude;
  String? longitude;

  Shipping(
    this.id,
    this.code,
    this.member_id,
    this.address,
    this.province,
    this.district,
    this.sub_district,
    this.postal_code,
    this.latitude,
    this.longitude,
  );

  factory Shipping.fromJson(Map<String, dynamic> json) => _$ShippingFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingToJson(this);
}
