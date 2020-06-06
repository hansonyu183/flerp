import 'package:flutter/material.dart';
import 'auto_complete/auto_complete.dart';

class DropDownData {
  DropDownData(this.value, this.text, this.easyCode);
  final String value;
  final String text;
  final String easyCode;

  String get searchString => '$value,$text,$easyCode';
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
  final List<DropDownData> dataList;
  final FormFieldSetter<String> onSaved;

  final GlobalKey<FLAutoCompleteState<DropDownData>> _key = GlobalKey<FLAutoCompleteState<DropDownData>>();
  @override
  Widget build(BuildContext context) {
    DropDownData _selectDate;
    List<DropDownData> _sugList = dataList;
    final TextEditingController _txtCon = TextEditingController();
    return Container(
      width: 150,
      child: FLAutoComplete<DropDownData>(
        key: _key,
        dataList: dataList,
        onSelectedSuggestion: (DropDownData suggestion) {
          _sugList = <DropDownData>[suggestion];
          _selectDate = suggestion;
          _txtCon.text = suggestion.text;
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
              onChanged: (String text) {
                _sugList = <DropDownData>[];
                if (text != null && text.isNotEmpty) {
                  for (final DropDownData data in dataList) {
                    final String option = data.searchString;
                    if (option.toLowerCase().contains(text.toLowerCase())) {
                      _sugList.add(data);
                    }
                  }
                  _selectDate = _sugList[0];
                }
                _key.currentState.updateSuggestionList(_sugList);
              },
              onSaved: (String value) {
                if (onSaved != null) {
                  onSaved(_selectDate.value);
                }
              },
              onEditingComplete: (){
                final String selectTxt=_selectDate.text;
                if (_txtCon.text!=selectTxt){
                  _txtCon.text=selectTxt;
                  _key.currentState.hideAutoComplete();
                }},
            ),
      ),
    );
  }
}
