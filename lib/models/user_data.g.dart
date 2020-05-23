// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return UserData()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..rols = json['rols'] as String
    ..modules = (json['modules'] as List)
        ?.map((e) =>
            e == null ? null : UserModule.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rols': instance.rols,
      'modules': instance.modules,
    };
