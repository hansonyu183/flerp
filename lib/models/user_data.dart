import 'package:json_annotation/json_annotation.dart';

import 'user_module.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
      UserData();

  int id;
  String name;
  String rols;
  List<UserModule> modules;

  factory UserData.fromJson(Map<String,dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
  

}


