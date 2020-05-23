import 'package:json_annotation/json_annotation.dart';

import 'package:flutter/material.dart';
import 'package:flerp/modules/modules.dart';


@JsonSerializable()
class Page {
      Page();

  int id;
  String name;
  String title;

  Widget get widget => Modules.buildWidget(name);

  

}


