// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sup _$SupFromJson(Map<String, dynamic> json) {
  return Sup(
    supId: json['supId'] as String,
    supName: json['supName'] as String,
    easyCode: json['easyCode'] as String,
  );
}

Map<String, dynamic> _$SupToJson(Sup instance) => <String, dynamic>{
      'supId': instance.supId,
      'supName': instance.supName,
      'easyCode': instance.easyCode,
    };
