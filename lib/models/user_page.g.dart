// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPage _$UserPageFromJson(Map<String, dynamic> json) {
  return UserPage()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..title = json['title'] as String;
}

Map<String, dynamic> _$UserPageToJson(UserPage instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
    };
