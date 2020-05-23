import 'dart:convert';
import 'package:flutter/material.dart';

class _Model {
  String supID;
  String supName;

  _Model(this.supID, this.supName);

  _Model.fromJson(Map<String, dynamic> json)
      : supID = json['supID'],
        supName = json['supName'];

  Map<String, dynamic> toJson() =>
    {
      'supID': supID,
      'supName': supName,
    };
}

class BaseSupEditor extends StatelessWidget {
  BaseSupEditor({Key key,this.json}) : super(key: key);
  final String json;
  final _name = "BaseSupEditor";
  final _title = "供应商资料";
  @override
  Widget build(BuildContext context) {    
      TextEditingController _txtCon = new TextEditingController();

    _Model _model; 
    if (json != null && json!=""){
     _model = new _Model.fromJson(jsonDecode(json));
    } else {
      _model = _Model("sup1","");
    }
    _txtCon.text=_model.supName;
    return  Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Text(_model.supID),
          TextField(
            controller: _txtCon,
            onChanged : (value) {_model.supName=value;}
          ),
          FlatButton(child: Text("Svae"),
            onPressed: (){
              print(1);
              })
          ]));
  }

}

