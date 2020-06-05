import 'package:flutter/material.dart';
import 'auto_complete/auto_complete.dart';

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

class DropDownField extends StatelessWidget {
  DropDownField(
      {Key key, this.label, this.iconDate, this.dataList, this.onSaved})
      : super(key: key);
  final String label;
  final IconData iconDate;
  final List<Map<String, dynamic>> dataList;
  final FormFieldSetter<String> onSaved;

  final GlobalKey<FLAutoCompleteState> _key = GlobalKey<FLAutoCompleteState>();
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> _selectDate;
    var _sugList = dataList;
    var _txtCon = TextEditingController();
    return Container(
      width: 150,
      child: FLAutoComplete(
        key: _key,
        dataList: dataList,
        onSelectedSuggestion: (suggestion) {
          _sugList = [suggestion];
          _selectDate = suggestion;
          _txtCon.text = suggestion["text"];
        },
            child: TextFormField(              
              controller: _txtCon,
              decoration: InputDecoration(
                  icon: InkWell(
                    child: Icon(
                      iconDate,
                    ),
                    onTap: () =>
                         _key.currentState.updateSuggestionList(dataList),
                  ),
                  labelText: label),
              onChanged: (text) {
                _sugList = [];
                if (text != null && text.isNotEmpty) {
                  for (Map<String, dynamic> data in dataList) {
                    var option =
                        "${data['value']},${data['text']},${data['easy_code']}";
                    if (option.toLowerCase().contains(text.toLowerCase())) {
                      _sugList.add(data);
                    }
                  }
                  _selectDate = _sugList[0];
                }
                _key.currentState.updateSuggestionList(_sugList);
              },
              onSaved: (value) {
                if (onSaved != null) {
                  onSaved(_selectDate["value"]);
                }
              },
              onEditingComplete: (){
                var selectTxt=_selectDate["text"];
                if (_txtCon.text!=selectTxt){
                  _txtCon.text=selectTxt;
                  _key.currentState.hideAutoComplete();
                }},
            ),
      ),
    );
  }
}
