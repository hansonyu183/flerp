import 'dart:convert';

import 'package:flerp/models/index.dart';
import 'package:flutter/material.dart';

import 'package:flerp/modules/base/eba/editor.dart';
import 'package:flerp/modules/base/res/editor.dart';
import 'package:flerp/modules/base/sup/editor.dart';
import 'package:flerp/modules/testPage/testPage1.dart';

import 'package:flerp/models/user_data.dart';

class Modules {
  static Widget buildWidget(String pageName){
    switch (pageName) {
      case  "BaseEbaEditor":
        return BaseEbaEditor();
      case  "BaseResEditor":
        return BaseResEditor();
      case  "BaseSupEditor":
        return BaseSupEditor();  
      case  "testPage1":
        return TestPage1();  
      default:
       return Text("404");
    }
  }
  
  static UserData defaultUserData(){
    return UserData.fromJson(jsonDecode(_userData));
  }
}

const String _userData = '''{
    "id": 0,
    "name": "hanson",
    "rols": "admin",
    "modules": [
        {
            "id": 0,
            "name": "基础资料",
            "modules": [
                {
                    "id": 0,
                    "name": "测试页面",
                    "pages": [
                        {
                            "id": 0,
                            "name": "testPage1",
                            "title":"页面1"
                        }
                    ]
                }
            ]
        }
    ]
}''';
