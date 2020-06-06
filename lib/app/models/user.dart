import 'package:json_annotation/json_annotation.dart';

import '../../core/models/rest_ful.dart';
import 'role.dart';
import 'user_page.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends RestFul {
  User({int id, this.name, this.password, this.phone,this.role,this.firstPage}):super(id:id,apiUrl:'user');

  @override
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  String name, phone, password;
  UserPage firstPage;
  Role role;
//  @JsonKey(ignore: true)
  //String apiUrl;

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  static  Future<User> fromServer (String name) async {
    const String url = 'user';
    return User.fromJson(await RestFul.getByName(url, name))
            ..apiUrl=url;
  }

  static  Future<User> login(String name,String password) async {
    const String url = 'user';
    return User.fromJson(await RestFul.login(url, name,password))
            ..apiUrl=url;
  }
}
