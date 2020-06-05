// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    name: json['name'] as String,
    password: json['password'] as String,
    phone: json['phone'] as String,
    role: json['role'] == null
        ? null
        : Role.fromJson(json['role'] as Map<String, dynamic>),
    firstPage: json['firstPage'] == null
        ? null
        : UserPage.fromJson(json['firstPage'] as Map<String, dynamic>),
  )..apiUrl = json['apiUrl'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'apiUrl': instance.apiUrl,
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'password': instance.password,
      'firstPage': instance.firstPage,
      'role': instance.role,
    };
