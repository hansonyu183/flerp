import 'package:json_annotation/json_annotation.dart';

import 'user_page.dart';

part 'user_module.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModule {
      UserModule({this.id,this.name,this.pages,this.modules});

  int id;
  String name;
  List<UserPage> pages;
  List<UserModule> modules;

  factory UserModule.fromJson(Map<String,dynamic> json) => _$UserModuleFromJson(json);
  Map<String, dynamic> toJson() => _$UserModuleToJson(this);  

}