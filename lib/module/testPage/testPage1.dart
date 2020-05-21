import 'package:flutter/material.dart';
import 'package:flerp/widgets/actionBar.dart';
import 'package:flerp/widgets/formButton/actionButton.dart';
import 'package:flerp/widgets/fromField/datePicker.dart';
import 'package:flerp/widgets/fromField/dropDown.dart';
import 'package:flerp/widgets/fromField/labelField.dart';
import 'package:flerp/widgets/fromField/jsTable.dart';

class TestPage1 extends StatefulWidget {
  @override
  TestPage1State createState() => TestPage1State();
}

class TestPage1State extends State<TestPage1> {
  final _formKey = GlobalKey<FormState>();
  var _fromValues = {
    // Key:    Value
    'date': DatePicker.dateToString(DateTime.now()),
    'amount': "0",
  };

  @override
  Widget build(BuildContext context) {
    var _state = _formKey.currentState;

    return Form(
        key: _formKey,
        child: Column(children: [
          ActionBar(actionButtons: [
            ActionButton.back(),
            ActionButton.forward(),
            ActionButton.print(),
            ActionButton.add(),
            ActionButton.save(onPressed: () {
              //_state.save();
              print(_state);
              print(_fromValues);
            })
          ]),
          Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.topLeft,
                child:
              Wrap(
                runSpacing: 6,
                children: [
                DatePicker(
                  label: "日期",
                  initialDate: _fromValues['date'],
                  onEditingComplete: (String value) => print(value),
                  onSaved: (String v) => _fromValues['date'] = v,
                ),
                LabelField(
                  iconData: Icons.monetization_on,
                  label: "金额",
                  initialValue: _fromValues['amount'],
                  onSaved: (String v) => _fromValues['amount'] = v,
                ),
                DropDownField(
                  label: "客户",
                  iconDate: Icons.account_box,
                  dataList: [
                    DropDownData("A0001", "高精有限公司", "gjyxgs"),
                    DropDownData("A0002", "工商银行", "gsyh"),
                    DropDownData("A0003", "坤洋实业", "kysy"),
                    DropDownData("A0004", "刘诚", "lc"),
                    DropDownData("A0005", "赐彩", "cc"),
                    DropDownData("A0006", "深赛尔", "sse"),
                    DropDownData("A0007", "德宝", "db"),
                    DropDownData("A0008", "安监国", "ajg"),
                    DropDownData("A0009", "联想", "lx"),
                    DropDownData("A00010", "格力", "gl"),
                    
                  ],
                ),
                JsTable(jsonData: '[{"name":"Ram","email":"ram@gmail.com","age":23,"DOB":"1990-12-01"},'
                              '{"name":"Shyam","email":"shyam23@gmail.com","age":18,"DOB":"1995-07-01"},'
                              '{"name":"John","email":"john@gmail.com","age":10,"DOB":"2000-02-24"},'
                              '{"name":"Ram","age":12,"DOB":"2000-02-01"}]')
              ]))),
        ]));
  }
}
