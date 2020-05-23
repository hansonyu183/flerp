import 'package:json_annotation/json_annotation.dart';

import 'user_page.dart';

part 'user_module.g.dart';

@JsonSerializable()
class UserModule {
      UserModule();

  int id;
  String name;
  List<UserPage> pages;
  List<UserModule> modules;

  factory UserModule.fromJson(Map<String,dynamic> json) => _$UserModuleFromJson(json);
  Map<String, dynamic> toJson() => _$UserModuleToJson(this);
  

}


