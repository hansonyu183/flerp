//import 'package:flutter/rendering.dart';

//import 'http.dart';

class RestFul {
  int id;

  RestFul({this.id});

  factory RestFul.fromJson(Map<String, dynamic> json) =>
      RestFul(id: json['id'] as int);

  Map<String, dynamic> toJson() => {'id': this.id};

  static  getByName(String url,String name)  {
    var data = {        'id': 1,
        'name': "this.name",
        'phone': "this.phone",
        'password':" this.password",
        'roleID': 1,
};
    // ud =  AppModules().defaultUserData;
    
    return data;
  }

  /* Future update() async {
    var data = await http.put("$url/$id", data: this.toJson());
    // ud =  AppModules().defaultUserData;
    return data;
  }*/

  update() {
    print("${this.runtimeType..toString().toLowerCase()}/$id");
    // ud =  AppModules().defaultUserData;
  }
}

class User extends RestFul {
  User({this.id, this.name, this.password, this.phone, this.roleID});

  int id;
  String name, phone, password;
  int roleID;

  @override
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int,
        name: json['name'] as String,
        password: json['password'] as String,
        phone: json['phone'] as String,
        roleID: json['roleID'] as int,
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'phone': this.phone,
        'password': this.password,
        'roleID': this.roleID,
      };

  static String url="user";
  factory User.fromServer(String name) => User.fromJson(RestFul.getByName(url,name));
 /*
  static Future<User> fromServer(int id) async {
    var data = await http.get("$url/$id");
    // ud =  AppModules().defaultUserData;
    return User.fromJson(data);
  }

    Future update(int id) async {
    var data = await http.put("$url/$id",data:this.toJson );
    // ud =  AppModules().defaultUserData;
    return data;
  }*/

}

main(){
var usr = User.fromServer("test");
 usr.update();
print(usr.toJson());
}
