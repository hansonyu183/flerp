import 'package:flutter/material.dart';
//import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  DatePicker(
      {Key key,
      this.label,
      this.onChanged,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.onSaved,
      this.readOnly = false,
      this.initialDate})
      : super(key: key);

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

  static String dateValidator(String value){
    try {
      var _date=DateFormat('yyyy-MM-dd').parse(value);
      return DateFormat('yyyy-MM-dd').format(_date)==value ? null : "日期格式有误";
    } catch (_) {
      return "日期格式有误";
    }    
  }

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  TextEditingController _txtCon;
  String _resultDate;

  Future<String> _selectDate(String initialDate, TextEditingController txtCon,
      BuildContext context) async {
    var date = await showDatePicker(
        context: context,
        initialDate: DateTime.parse(initialDate),
        firstDate: DateTime(2010, 1),
        lastDate: DateTime(2030, 1));
    var dateStr = DatePicker.dateToString(date);
    if (initialDate != dateStr) {
      txtCon.text = dateStr;
      if (widget.onChanged != null) {
        widget.onChanged(dateStr);
      }
      if (widget.onEditingComplete != null) {
        widget.onEditingComplete(dateStr);
      }
    }
    return dateStr;
  }

  @override
  void initState() {
    super.initState();
    _txtCon = TextEditingController(text: widget.initialDate);
    _resultDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        child: TextFormField(
          autovalidate: true,
          validator: DatePicker.dateValidator,
          onChanged: widget.onChanged,
          onEditingComplete: () => widget.onEditingComplete(_resultDate),
          onFieldSubmitted: widget.onFieldSubmitted,
          onSaved: widget.onSaved,
          readOnly: widget.readOnly,
          controller: _txtCon,
          decoration: InputDecoration(
            icon: InkWell(
                child: Icon(Icons.calendar_today),
                onTap: () async {
                  _resultDate =
                      await _selectDate(widget.initialDate, _txtCon, context);
                }),
            labelText: widget.label,
          ),
        ));
  }

}
