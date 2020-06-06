// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Module _$ModuleFromJson(Map<String, dynamic> json) {
  return Module(
    id: json['id'] as int,
    name: json['name'] as String,
    pages: (json['pages'] as List<UserPage>)
        ?.map((dynamic e) =>
            e == null ? null : UserPage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    modules: (json['modules'] as List<UserPage>)
        ?.map((dynamic e) =>
            e == null ? null : Module.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ModuleToJson(Module instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pages': instance.pages?.map((UserPage e) => e?.toJson())?.toList(),
      'modules': instance.modules?.map((Module e) => e?.toJson())?.toList(),
    };
