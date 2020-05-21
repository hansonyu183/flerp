//import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/autoCompete.dart';

class DropDownData {
  DropDownData(this.value, this.text, this.easyCode);
  final String value;
  final String text;
  final String easyCode;

  String get sarchString => '$value,$text,$easyCode';
  @override
  String toString() {
  return text;
   }
}

class DropDownField extends StatefulWidget {
  DropDownField({Key key, this.label, this.iconDate, this.dataList})
      : super(key: key);
  final String label;
  final IconData iconDate;
  final List<DropDownData> dataList;
  @override
  _DropDownFieldState createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  final GlobalKey<FLAutoCompleteState> _key = GlobalKey<FLAutoCompleteState>();
  final FocusNode _focusNode = FocusNode();
  var _txtCon = TextEditingController();
  DropDownData _selectDate;

  @override
  Widget build(BuildContext context) {
  List<DropDownData> sugList = widget.dataList;
    return Container(
      width: 150,
      child: FLAutoComplete(
        key: _key,
        focusNode: _focusNode,
        dataList: sugList,
        onSelectedSuggestion: (suggestion) {
          sugList=[suggestion];
          _selectDate =suggestion;
          _txtCon.text = _selectDate.text;
          print('select $suggestion');
        },
        child: RawKeyboardListener(
          focusNode: _focusNode,
          onKey: (RawKeyEvent event){
            if(event.isKeyPressed(LogicalKeyboardKey.enter)){
               _txtCon.text = _selectDate.text;
               _key.currentState.hideAutoComplete();
              print(sugList);
            }
          },
          child: 
         TextFormField(
          controller: _txtCon,
          decoration: InputDecoration(
            icon: Icon(widget.iconDate),
            labelText: widget.label,
            suffix:               InkWell(
                  child: Icon(Icons.arrow_drop_down,size: 10,),
                  onTap: ()=>_key.currentState.updateSuggestionList(sugList),
                 )
          ),
         // focusNode: _focusNode,
          onChanged: (text) {
              sugList = [];

            if (text != null && text.isNotEmpty) {

              for (DropDownData data in widget.dataList) {
                var option = data.sarchString;
                if (option.toLowerCase().contains(text.toLowerCase())) {
                  sugList.add(data);
                }
              }
              _selectDate=sugList[0];
            }
            _key.currentState.updateSuggestionList(sugList);
          },
          onEditingComplete: () {
            //_key.currentState.hideAutoComplete();
             //_txtCon.text = _selectDate.text;
            // print("EditingComplete ");
          },
        )),
      ),
    );
  }
}
