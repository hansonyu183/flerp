import 'package:json_annotation/json_annotation.dart';

import 'package:flutter/material.dart';
//import 'package:flerp/modules/modules.dart';
import 'package:flerp/domain/index.dart';

part 'user_page.g.dart';

@JsonSerializable(explicitToJson: true)
class UserPage {
  UserPage({this.name});

  PageEnum name;

  @JsonKey(ignore: true)
  String get title => userPageTitleMap[name];

  @JsonKey(ignore: true)
  Widget get widget => _widget??userPageBuilderMap[name].call();

  @JsonKey(ignore: true)
  Widget _widget;

  factory UserPage.fromJson(Map<String, dynamic> json) =>
      _$UserPageFromJson(json);
  Map<String, dynamic> toJson() => _$UserPageToJson(this);
}

typedef PageBuilder = Widget Function();

final userPageBuilderMap = {
  PageEnum.roleEditor: () => RoleEditor(),
  PageEnum.baseEbaEditor: () => BaseEbaEditor(),
  PageEnum.baseResEditor: () => BaseResEditor(),
  PageEnum.baseSupEditor: () => BaseSupEditor(),
  PageEnum.resIn: () => ResIn(),
  PageEnum.bankNoteVou: () => BankNoteVou(),
  PageEnum.testPage1: () => TestPage1(),
};

final userPageTitleMap = {
   PageEnum.roleEditor: "角色编辑",
  PageEnum.baseEbaEditor: "客户资料",
  PageEnum.baseResEditor: "商品资料",
  PageEnum.baseSupEditor: "供应商资料",
  PageEnum.resIn: "入库单",
  PageEnum.bankNoteVou: "进账单",
  PageEnum.testPage1: "测试页1",
};

enum PageEnum {
  roleEditor,
  baseEbaEditor,
  baseResEditor,
  baseSupEditor,
  resIn,
  bankNoteVou,
  testPage1
}
