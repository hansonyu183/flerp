// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eba.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Eba _$EbaFromJson(Map<String, dynamic> json) {
  return Eba(
    ebaId: json['ebaId'] as String,
    ebaName: json['ebaName'] as String,
    easyCode: json['easyCode'] as String,
  );
}

Map<String, dynamic> _$EbaToJson(Eba instance) => <String, dynamic>{
      'ebaId': instance.ebaId,
      'ebaName': instance.ebaName,
      'easyCode': instance.easyCode,
    };
