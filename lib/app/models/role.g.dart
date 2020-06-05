// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) {
  return Role(
    id: json['id'] as int,
    name: json['name'] as String,
    modules: (json['modules'] as List)
        ?.map((e) =>
            e == null ? null : Module.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'modules': instance.modules?.map((e) => e?.toJson())?.toList(),
    };
