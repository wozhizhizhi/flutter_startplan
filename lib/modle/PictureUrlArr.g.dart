// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PictureUrlArr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PictureUrlArr _$PictureUrlArrFromJson(Map<String, dynamic> json) {
  return PictureUrlArr(
      (json['pictureUrlArr'] as List)?.map((e) => e as String)?.toList(),
      json['statusCode'] as int,
      json['statusMsg'] as String);
}

Map<String, dynamic> _$PictureUrlArrToJson(PictureUrlArr instance) =>
    <String, dynamic>{
      'pictureUrlArr': instance.pictureUrlArr,
      'statusCode': instance.statusCode,
      'statusMsg': instance.statusMsg
    };
