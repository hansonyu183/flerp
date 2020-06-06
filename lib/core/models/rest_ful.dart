import 'http.dart';

class RestFul {
  RestFul({this.id, this.apiUrl});

  factory RestFul.fromJson(Map<String, dynamic> json) =>
      RestFul(id: json['id'] as int, apiUrl: json['apiUrl'] as String);

  int id;
  String apiUrl;

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'apiUrl': apiUrl};

  static Future<Map<String, dynamic>> login(
      String url, String name, String password) async {
    return await http.get(url,
        parameters: <String, dynamic>{'name': name, 'password': password});
  }

  static Future<Map<String, dynamic>> getByName(String url,String name) async {
      
    return await http.get(url, parameters: <String, dynamic>{'name': name});
  }

  Future<Map<String, dynamic>> put() async {
    return await http.put('$apiUrl/$id', data: toJson());
  }

  Future<Map<String, dynamic>> post() async {
    return await http.post('$apiUrl/$id', data: toJson());
  }

  Future<Map<String, dynamic>> delete() async {
    return await http.delete('$apiUrl/$id', data: toJson());
  }
}
