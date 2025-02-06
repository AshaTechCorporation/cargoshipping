// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      (json['id'] as num?)?.toInt(),
      json['code'] as String?,
      json['member_type'] as String?,
      json['fname'] as String?,
      json['lname'] as String?,
      json['phone'] as String?,
      json['birth_date'] as String?,
      json['gender'] as String?,
      json['importer_code'] as String?,
      json['password'] as String?,
      json['referrer'] as String?,
      json['address'] as String?,
      json['province'] as String?,
      json['district'] as String?,
      json['sub_district'] as String?,
      json['postal_code'] as String?,
      json['wallet_balance'] as String?,
      json['image'] as String?,
      json['detail'] == null ? null : Company.fromJson(json['detail'] as Map<String, dynamic>),
      (json['ship_address'] as List<dynamic>?)?.map((e) => Shipping.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'member_type': instance.member_type,
      'fname': instance.fname,
      'lname': instance.lname,
      'phone': instance.phone,
      'birth_date': instance.birth_date,
      'gender': instance.gender,
      'importer_code': instance.importer_code,
      'password': instance.password,
      'referrer': instance.referrer,
      'address': instance.address,
      'province': instance.province,
      'district': instance.district,
      'sub_district': instance.sub_district,
      'postal_code': instance.postal_code,
      'wallet_balance': instance.wallet_balance,
      'image': instance.image,
      'detail': instance.detail,
      'ship_address': instance.ship_address,
    };
