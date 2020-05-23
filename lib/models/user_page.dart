import 'package:json_annotation/json_annotation.dart';

import 'package:flutter/material.dart';
import 'package:flerp/modules/modules.dart';

part 'user_page.g.dart';

@JsonSerializable()
class UserPage {
      UserPage();

  int id;
  String name;
  String title;
  Widget get widget => Modules.buildWidget(name);
  
  factory UserPage.fromJson(Map<String,dynamic> json) => _$UserPageFromJson(json);
  Map<String, dynamic> toJson() => _$UserPageToJson(this);
  

}


