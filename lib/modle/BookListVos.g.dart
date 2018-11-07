// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BookListVos.dart';
// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookListVos _$BookListVosFromJson(Map<String, dynamic> json) {
  return BookListVos((json['bookListVoArr'] as List)
      ?.map((e) =>
          e == null ? null : BookListVoArr.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$BookListVosToJson(BookListVos instance) =>
    <String, dynamic>{'bookListVoArr': instance.bookListVoArr};

BookListVoArr _$BookListVoArrFromJson(Map<String, dynamic> json) {
  return BookListVoArr(
      json['author'] as String,
      json['coverUrl'] as String,
      json['difficultyIndex'] as int,
      json['id'] as int,
      json['introduction'] as String,
      json['locationTags'] as String,
      json['name'] as String,
      json['rdi'] as int,
      json['recommend'] as int);
}

Map<String, dynamic> _$BookListVoArrToJson(BookListVoArr instance) =>
    <String, dynamic>{
      'author': instance.author,
      'coverUrl': instance.coverUrl,
      'difficultyIndex': instance.difficultyIndex,
      'id': instance.id,
      'introduction': instance.introduction,
      'locationTags': instance.locationTags,
      'name': instance.name,
      'rdi': instance.rdi,
      'recommend': instance.recommend
    };
