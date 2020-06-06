import 'package:json_annotation/json_annotation.dart';

part 'sup.g.dart';

@JsonSerializable()
class Sup {
  Sup({this.supId, this.supName, this.easyCode});

  factory Sup.fromJson(Map<String, dynamic> json) => _$SupFromJson(json);

  String supId, supName, easyCode;
  
  Map<String, dynamic> toJson() => _$SupToJson(this);
}
