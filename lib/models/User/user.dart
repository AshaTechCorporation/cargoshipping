import 'package:cargoshipping/models/User/company.dart';
import 'package:cargoshipping/models/User/shipping.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? code;
  String? member_type;
  String? fname;
  String? lname;
  String? phone;
  String? birth_date;
  String? gender;
  String? importer_code;
  String? password;
  String? referrer;
  String? address;
  String? province;
  String? district;
  String? sub_district;
  String? postal_code;
  String? image;
  Company? detail;
  List<Shipping>? ship_address;

  User(
    this.id,
    this.code,
    this.member_type,
    this.fname,
    this.lname,
    this.phone,
    this.birth_date,
    this.gender,
    this.importer_code,
    this.password,
    this.referrer,
    this.address,
    this.province,
    this.district,
    this.sub_district,
    this.postal_code,
    this.image,
    this.detail,
    this.ship_address,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
