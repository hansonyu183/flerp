import 'http.dart';

class RestFul {
  int id;
  String apiUrl;
  RestFul({this.id, this.apiUrl});

  factory RestFul.fromJson(Map<String, dynamic> json) =>
      RestFul(id: json['id'] as int, apiUrl: json['apiUrl'] as String);

  Map<String, dynamic> toJson() => {'id': this.id, 'apiUrl': this.apiUrl};

  static login(String url, name,password) async {
    var data = await http.get("$url", parameters: {"name": name,"password":password});
    return data;
  }


  static getByName(String url, String name) async {
    var data = await http.get("$url", parameters: {"name": name});
    return data;
  }

  Future put() async {
    var data = await http.put("$apiUrl/$id", data: this.toJson());
    return data;
  }

  Future post() async {
    var data = await http.post("$apiUrl/$id", data: this.toJson());
    return data;
  }

  Future delete() async {
    var data = await http.delete("$apiUrl/$id", data: this.toJson());
    return data;
  }
}
