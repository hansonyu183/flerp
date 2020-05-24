import 'package:json_annotation/json_annotation.dart';

import 'package:flutter/material.dart';
//import 'package:flerp/modules/modules.dart';

part 'user_page.g.dart';


@JsonSerializable(explicitToJson:true)
class UserPage {
      UserPage({this.id,this.name,this.title,@JsonKey(ignore: true) this.buildWidget});

  int id;
  String name;
  String title;
  
  @JsonKey(ignore: true)
  BuildWidget buildWidget;

  //Widget get widget => Modules.buildWidget(name);
  
  factory UserPage.fromJson(Map<String,dynamic> json) => _$UserPageFromJson(json);
  Map<String, dynamic> toJson() => _$UserPageToJson(this);
  

}

typedef BuildWidget = Widget Function();
