import 'package:json_annotation/json_annotation.dart';

import 'module.dart';

part 'role.g.dart';

@JsonSerializable(explicitToJson: true)
class Role {
  Role({this.id, this.name, this.modules});
  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  int id;
  String name;
  List<Module> modules;

  Map<String, dynamic> toJson() => _$RoleToJson(this);

}
