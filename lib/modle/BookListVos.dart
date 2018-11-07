import 'package:json_annotation/json_annotation.dart';

part 'BookListVos.g.dart';


@JsonSerializable()
class BookListVos extends Object {

  @JsonKey(name: 'bookListVoArr')
  List<BookListVoArr> bookListVoArr;

  BookListVos(this.bookListVoArr,);

  factory BookListVos.fromJson(Map<String, dynamic> srcJson) => _$BookListVosFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BookListVosToJson(this);

}


@JsonSerializable()
class BookListVoArr extends Object {

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'coverUrl')
  String coverUrl;

  @JsonKey(name: 'difficultyIndex')
  int difficultyIndex;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'introduction')
  String introduction;

  @JsonKey(name: 'locationTags')
  String locationTags;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'rdi')
  int rdi;

  @JsonKey(name: 'recommend')
  int recommend;

  BookListVoArr(this.author,this.coverUrl,this.difficultyIndex,this.id,this.introduction,this.locationTags,this.name,this.rdi,this.recommend,);

  factory BookListVoArr.fromJson(Map<String, dynamic> srcJson) => _$BookListVoArrFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BookListVoArrToJson(this);

}


