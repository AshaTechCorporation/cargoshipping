// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'propimgs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropImgs _$PropImgsFromJson(Map<String, dynamic> json) => PropImgs(
      (json['prop_img'] as List<dynamic>?)
          ?.map((e) => PropImg.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PropImgsToJson(PropImgs instance) => <String, dynamic>{
      'prop_img': instance.prop_img,
    };
