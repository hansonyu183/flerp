import 'package:json_annotation/json_annotation.dart';
part 'respone_body.g.dart';

@JsonSerializable()
class ResponeBody<T> {
    ResponeBody();

    bool success;
    String code;
    String message;
    T data;
    
    factory ResponeBody.fromJson(Map<String,dynamic> json) => _$ResponeBodyFromJson(json);
    Map<String, dynamic> toJson() => _$ResponeBodyToJson(this);
}
