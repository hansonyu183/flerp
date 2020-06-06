import 'package:flutter/material.dart';

class BaseEbaEditor extends StatelessWidget {
  const BaseEbaEditor({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {   
    return  Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget>[
          const Text(''),
          TextField(
            onChanged : (String value) {}
          ),
          FlatButton(child: const Text('save'),
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
      globalConsumer.state.baseEbaEditorModel.ebaInf=_ebaInf;
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
                globalConsumer.state.baseEbaEditorModel.ebaId=value;
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