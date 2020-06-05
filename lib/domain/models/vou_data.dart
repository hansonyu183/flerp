import 'eba.dart';
import 'sup.dart';
import 'account.dart';

import 'package:json_annotation/json_annotation.dart';

part 'vou_data.g.dart';

@JsonSerializable(explicitToJson: true)
class VouData {
  VouData({this.vouId,this.vouNo,this.vouDate,this.vouAmo,this.sup,this.eba,this.srcAccount,this.targAccount,this.ioAmo,this.jsonItemList});
  int vouId;
  String vouNo, vouDate;
  Eba eba;
  Sup sup;
  String vouAmo;
  Account srcAccount, targAccount;
  String ioAmo;
  String jsonItemList;

  factory VouData.fromJson(Map<String, dynamic> json) =>
      _$VouDataFromJson(json);
  Map<String, dynamic> toJson() => _$VouDataToJson(this);
}
