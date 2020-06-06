import 'package:json_annotation/json_annotation.dart';

import 'account.dart';
import 'eba.dart';
import 'sup.dart';

part 'vou_data.g.dart';

@JsonSerializable(explicitToJson: true)
class VouData {
  VouData({this.vouId,this.vouNo,this.vouDate,this.vouAmo,this.sup,this.eba,this.srcAccount,this.targeAccount,this.ioAmo,this.jsonItemList});

    factory VouData.fromJson(Map<String, dynamic> json) =>
      _$VouDataFromJson(json);

  int vouId;
  String vouNo, vouDate;
  Eba eba;
  Sup sup;
  String vouAmo;
  Account srcAccount, targeAccount;
  String ioAmo;
  String jsonItemList;

  Map<String, dynamic> toJson() => _$VouDataToJson(this);
}
