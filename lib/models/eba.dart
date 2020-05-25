import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'eba.g.dart';

@JsonSerializable()
class Eba {
  Eba({this.ebaId, this.ebaName, this.easyCode});

  String ebaId, ebaName, easyCode;
  factory Eba.fromJson(Map<String, dynamic> json) => _$EbaFromJson(json);
  Map<String, dynamic> toJson() => _$EbaToJson(this);
}
