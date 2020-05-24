import 'package:json_annotation/json_annotation.dart';

import 'user_module.dart';

part 'user_data.g.dart';

@JsonSerializable(explicitToJson:true)
class UserData {

  int id;
  String name;
  String role;
  List<UserModule> modules;

  UserData({this.id,this.name,this.role,this.modules});

  factory UserData.fromJson(Map<String,dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
  

}
