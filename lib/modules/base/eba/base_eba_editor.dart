import 'dart:convert';
import 'package:flutter/material.dart';

class _Model {
  String ebaId;
  String ebaName;

  _Model(this.ebaId, this.ebaName);

  _Model.fromJson(Map<String, dynamic> json)
      : ebaId = json['ebaId'],
        ebaName = json['ebaName'];

  Map<String, dynamic> toJson() =>
    {
      'ebaId': ebaId,
      'ebaName': ebaName,
    };
}

class BaseEbaEditor extends StatelessWidget {
  BaseEbaEditor({Key key,this.json}) : super(key: key);
  final String json;
  static const String js="d";
  @override
  Widget build(BuildContext context) {   
    _Model _model; 
    if (json != null && json!=""){
     _model = new _Model.fromJson(jsonDecode(json));
    } else {
      _model = _Model("eba1","");
    }
    return  Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Text(_model.ebaId),
          TextField(
            onChanged : (value) {_model.ebaName=value;}
          ),
          FlatButton(child: Text("Svae"),
            onPressed: (){
              print(1);
              })
          ]));
  }

}



/*

class BaseEbaEditorModel{
  String ebaId="";
  String ebaInf="";
}

class BaseEbaEditor extends StatefulWidget {
  BaseEbaEditor({Key key,this.model}) : super(key: key);
  final BaseEbaEditorModel model;
  @override
  _BaseEbaEditor createState() => _BaseEbaEditor();
}

class _BaseEbaEditor extends State<BaseEbaEditor> {
  String _ebaId;
  String _ebaInf;
  final TextEditingController txtCon =new TextEditingController();
  void _getEba() async {
    var r = await BaseEba.data({"eba_id": _ebaId});
    setState(() {
      _ebaInf = r.data.toString();
      gobalConsumer.state.baseEbaEditorModel.ebaInf=_ebaInf;
    });
  }

  @override
  Widget build(BuildContext context) {
    _ebaId=widget.model.ebaInf;
    _ebaInf=widget.model.ebaInf;
    txtCon.text=_ebaId;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: txtCon,
              onChanged: (value) {
                _ebaId = value;
                gobalConsumer.state.baseEbaEditorModel.ebaId=value;
              },
            ),
            Text(_ebaInf)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getEba,
        tooltip: 'GetEba',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/