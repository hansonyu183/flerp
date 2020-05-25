// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    accountId: json['accountId'] as String,
    accountName: json['accountName'] as String,
    easyCode: json['easyCode'] as String,
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'accountId': instance.accountId,
      'accountName': instance.accountName,
      'easyCode': instance.easyCode,
    };
