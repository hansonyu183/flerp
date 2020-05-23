// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModule _$UserModuleFromJson(Map<String, dynamic> json) {
  return UserModule()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..pages = (json['pages'] as List)
        ?.map((e) =>
            e == null ? null : UserPage.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..modules = (json['modules'] as List)
        ?.map((e) =>
            e == null ? null : UserModule.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$UserModuleToJson(UserModule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pages': instance.pages,
      'modules': instance.modules,
    };
