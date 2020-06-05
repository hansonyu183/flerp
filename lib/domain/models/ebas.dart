import 'eba.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ebas.g.dart';

@JsonSerializable(explicitToJson: true)
class Ebas {
  Ebas();

  List<Eba> ebas;
  factory Ebas.fromJson(Map<String, dynamic> json) => _$EbasFromJson(json);
  Map<String, dynamic> toJson() => _$EbasToJson(this);



}
