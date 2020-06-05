import 'package:json_annotation/json_annotation.dart';

import 'user_page.dart';

part 'module.g.dart';

@JsonSerializable(explicitToJson: true)
class Module {
      Module({this.id,this.name,this.pages,this.modules});

  int id;
  String name;
  List<UserPage> pages;
  List<Module> modules;

  factory Module.fromJson(Map<String,dynamic> json) => _$ModuleFromJson(json);
  Map<String, dynamic> toJson() => _$ModuleToJson(this);  

}