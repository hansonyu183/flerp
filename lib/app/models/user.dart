import '../../core/models/rest_ful.dart';
import 'user_page.dart';
import 'role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends RestFul {
  User({this.id, this.name, this.password, this.phone,this.role,this.firstPage});

  int id;
  String name, phone, password;
  UserPage firstPage;
  Role role;
//  @JsonKey(ignore: true)
  //String apiUrl;

  @override
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromServer(String name) {
    var url = "user";
    return User.fromJson(RestFul.getByName(url, name))
            ..apiUrl=url;
  }

  factory User.login(String name,String password) {
    var url = "user";
    return User.fromJson(RestFul.login(url, name,password))
            ..apiUrl=url;
  }
}
