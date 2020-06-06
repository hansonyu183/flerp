import 'package:flutter/material.dart';

class _Model {
    _Model(this.supID, this.supName);

  _Model.fromJson(Map<String, String> json)
      : supID = json['supID'],
        supName = json['supName'];

  String supID;
  String supName;


  Map<String, dynamic> toJson() =>
    <String, String>{
      'supID': supID,
      'supName': supName,
    };
}

class BaseSupEditor extends StatelessWidget {
  const BaseSupEditor({Key key,this.json}) : super(key: key);
  final Map<String, String> json;
  @override
  Widget build(BuildContext context) {    
      final TextEditingController _txtCon = TextEditingController();

    _Model _model; 
    if (json != null ){
     _model =  _Model.fromJson(json);
    } else {
      _model = _Model('sup1','');
    }
    _txtCon.text=_model.supName;
    return  Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget>[
          Text(_model.supID),
          TextField(
            controller: _txtCon,
            onChanged : (String value) {_model.supName=value;}
          ),
          FlatButton(child: const Text('Save'),
            onPressed: (){
              print(1);
              })
          ]));
  }

}

