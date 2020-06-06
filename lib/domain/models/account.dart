import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  Account({this.accountId, this.accountName, this.easyCode});
  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  String accountId, accountName, easyCode;
  
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
