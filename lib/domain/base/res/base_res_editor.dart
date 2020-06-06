import 'package:flutter/material.dart';

class _Model {
    _Model(this.resID, this.resName);

  _Model.fromJson(Map<String, String> json)
      : resID = json['resID'],
        resName = json['resName'];

  String resID;
  String resName;


  Map<String, dynamic> toJson() =>
    <String, String>{
      'resID': resID,
      'resName': resName,
    };
}

class BaseResEditor extends StatelessWidget {
  const BaseResEditor({Key key,this.json}) : super(key: key);
  final Map<String, String> json;
  @override
  Widget build(BuildContext context) {    
    _Model _model; 
    if (json != null ){
     _model =  _Model.fromJson(json);
    } else {
      _model = _Model('res1','');
    }
    return  Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget>[
          Text(_model.resID),
          TextField(
            onChanged : (String value) {_model.resName=value;}
          ),
          FlatButton(child: const Text('Save'),
            onPressed: (){
              print(1);
              })
          ]));
  }

}

