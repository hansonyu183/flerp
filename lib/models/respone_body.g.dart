// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'respone_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponeBody _$ResponeBodyFromJson(Map<String, dynamic> json) {
  return ResponeBody()
    ..success = json['success'] as bool
    ..code = json['code'] as String
    ..message = json['message'] as String
    ..data = json['data'];
}

Map<String, dynamic> _$ResponeBodyToJson(ResponeBody instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data
    };
