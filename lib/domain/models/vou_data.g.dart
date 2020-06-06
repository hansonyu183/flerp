// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vou_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VouData _$VouDataFromJson(Map<String, dynamic> json) {
  return VouData(
    vouId: json['vouId'] as int,
    vouNo: json['vouNo'] as String,
    vouDate: json['vouDate'] as String,
    vouAmo: json['vouAmo'] as String,
    sup: json['sup'] == null
        ? null
        : Sup.fromJson(json['sup'] as Map<String, dynamic>),
    eba: json['eba'] == null
        ? null
        : Eba.fromJson(json['eba'] as Map<String, dynamic>),
    srcAccount: json['srcAccount'] == null
        ? null
        : Account.fromJson(json['srcAccount'] as Map<String, dynamic>),
    targeAccount: json['targeAccount'] == null
        ? null
        : Account.fromJson(json['targeAccount'] as Map<String, dynamic>),
    ioAmo: json['ioAmo'] as String,
    jsonItemList: json['jsonItemList'] as String,
  );
}

Map<String, dynamic> _$VouDataToJson(VouData instance) => <String, dynamic>{
      'vouId': instance.vouId,
      'vouNo': instance.vouNo,
      'vouDate': instance.vouDate,
      'eba': instance.eba?.toJson(),
      'sup': instance.sup?.toJson(),
      'vouAmo': instance.vouAmo,
      'srcAccount': instance.srcAccount?.toJson(),
      'targeAccount': instance.targeAccount?.toJson(),
      'ioAmo': instance.ioAmo,
      'jsonItemList': instance.jsonItemList,
    };
