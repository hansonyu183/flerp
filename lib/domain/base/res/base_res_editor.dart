import 'dart:convert';
import 'package:flutter/material.dart';

class _Model {
  String resID;
  String resName;

  _Model(this.resID, this.resName);

  _Model.fromJson(Map<String, dynamic> json)
      : resID = json['resID'],
        resName = json['resName'];

  Map<String, dynamic> toJson() =>
    {
      'resID': resID,
      'resName': resName,
    };
}

class BaseResEditor extends StatelessWidget {
  BaseResEditor({Key key,this.json}) : super(key: key);
  final String json;
  @override
  Widget build(BuildContext context) {    
    _Model _model; 
    if (json != null && json!=""){
     _model = new _Model.fromJson(jsonDecode(json));
    } else {
      _model = _Model("res1","");
    }
    return  Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Text(_model.resID),
          TextField(
            onChanged : (value) {_model.resName=value;}
          ),
          FlatButton(child: Text("Svae"),
            onPressed: (){
              print(1);
              })
          ]));
  }

}

