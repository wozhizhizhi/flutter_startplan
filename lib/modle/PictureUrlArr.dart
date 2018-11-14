import 'package:json_annotation/json_annotation.dart';

part 'PictureUrlArr.g.dart';


@JsonSerializable()
class PictureUrlArr extends Object {

  @JsonKey(name: 'pictureUrlArr')
  List<String> pictureUrlArr;

  @JsonKey(name: 'statusCode')
  int statusCode;

  @JsonKey(name: 'statusMsg')
  String statusMsg;

  PictureUrlArr(this.pictureUrlArr,this.statusCode,this.statusMsg,);

  factory PictureUrlArr.fromJson(Map<String, dynamic> srcJson) => _$PictureUrlArrFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PictureUrlArrToJson(this);

}
