import 'package:json_annotation/json_annotation.dart';

import 'eba.dart';

part 'ebas.g.dart';

@JsonSerializable(explicitToJson: true)
class Ebas {
  Ebas();

  factory Ebas.fromJson(Map<String, dynamic> json) => _$EbasFromJson(json);

  List<Eba> ebas;

  Map<String, dynamic> toJson() => _$EbasToJson(this);

}
