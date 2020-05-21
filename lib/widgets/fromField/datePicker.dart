import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  DatePicker({
    this.label,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.readOnly = false,
    this.initialDate
  });

  final String label;
  final String initialDate;
  final void Function(String) onChanged;
  final Function(String value) onEditingComplete;
  final void Function(String) onFieldSubmitted;
  final void Function(String) onSaved;
  final bool readOnly;

   static String dateToString(DateTime date) {
    return "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    String _resultDate;
    var _txtCon = TextEditingController(text: initialDate);

    return Container(
        width: 150,
        child: TextFormField(
            onChanged: onChanged,
            onEditingComplete: () => onEditingComplete(_resultDate),
            onFieldSubmitted: onFieldSubmitted,
            onSaved: onSaved,
            readOnly: readOnly,
            controller: _txtCon,
            decoration: InputDecoration(
              icon: Icon(Icons.calendar_today),
              labelText: label,
            ),
            onTap: () async {
              _resultDate = await _selectDate(initialDate, _txtCon, context);
            }));
  }


  Future<String> _selectDate(String initialDate, TextEditingController txtCon,
      BuildContext context) async {
    var date = await showDatePicker(
        context: context,
        initialDate: DateTime.parse(initialDate),
        firstDate: DateTime(2010, 1),
        lastDate: DateTime(2030, 1));
    var dateStr = dateToString(date);
    if (initialDate != dateStr) {
      txtCon.text = dateStr;
      if (onChanged != null) {
        onChanged(dateStr);
      }
      if (onEditingComplete != null) {
        onEditingComplete(dateStr);
      }
    }
    return dateStr;
  }
}
