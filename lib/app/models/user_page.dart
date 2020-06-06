import 'package:json_annotation/json_annotation.dart';

import 'package:flutter/material.dart';
//import 'package:flerp/modules/modules.dart';
import 'package:flerp/domain/index.dart';

part 'user_page.g.dart';

@JsonSerializable(explicitToJson: true)
class UserPage {
  UserPage({this.name});
  factory UserPage.fromJson(Map<String, dynamic> json) =>
      _$UserPageFromJson(json);

  PageEnum name;

  @JsonKey(ignore: true)
  String get title => userPageTitleMap[name];

  @JsonKey(ignore: true)
  Widget get widget => _widget??userPageBuilderMap[name].call();

  @JsonKey(ignore: true)
  Widget _widget;

  Map<String, dynamic> toJson() => _$UserPageToJson(this);
}

typedef PageBuilder = Widget Function();

final Map<PageEnum, Widget Function()> userPageBuilderMap = <PageEnum, Widget Function()>{
  PageEnum.roleEditor: () => const RoleEditor(),
  PageEnum.baseEbaEditor: () => const BaseEbaEditor(),
  PageEnum.baseResEditor: () => const BaseResEditor(),
  PageEnum.baseSupEditor: () => const BaseSupEditor(),
  PageEnum.resIn: () => ResIn(),
  PageEnum.bankNoteVou: () => const BankNoteVou(),
  PageEnum.testPage1: () => TestPage1(),
};

final Map<PageEnum, String> userPageTitleMap = <PageEnum, String>{
   PageEnum.roleEditor: '角色编辑',
  PageEnum.baseEbaEditor: '客户资料',
  PageEnum.baseResEditor: '商品资料',
  PageEnum.baseSupEditor: '供应商资料',
  PageEnum.resIn: '入库单',
  PageEnum.bankNoteVou: '进账单',
  PageEnum.testPage1: '测试页1',
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
