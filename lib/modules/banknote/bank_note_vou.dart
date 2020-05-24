import 'package:flutter/material.dart';
import 'package:flerp/widgets/erp_widgets/erp_widgets.dart';
import 'package:flerp/widgets/json_form/json_form.dart';

class BankNoteVou extends StatefulWidget {
  BankNoteVou({Key key}) : super(key: key);
  static String pageTitle="票据处理单";
  @override
  _BankNoteVouState createState() => _BankNoteVouState();
}

class _BankNoteVouState extends State<BankNoteVou> {
   final _formKey = GlobalKey<FormState>();
  var _fromValues = {
    // Key:    Value
    'date': DatePicker.dateToString(DateTime.now()),
    'amount': "0",
  };

  @override
  Widget build(BuildContext context) {

    return Form(
        key: _formKey,
        child: Column(children: [
          Row(children: [
            ActionButton.print(),
            ActionButton.add(),
            ActionButton.save(onPressed: () {
            }),
            ActionButton.check(),
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
                        {
                          "value": "A0001",
                          "text": "高精有限公司",
                          "easy_code": "gjyxgs"
                        },
                        {"value": "A0002", "text": "工商银行", "easy_code": "gsyh"},
                        {"value": "A0003", "text": "坤洋实业", "easy_code": "kysy"},
                        {"value": "A0004", "text": "刘诚", "easy_code": "lc"},
                        {"value": "A0005", "text": "赐彩", "easy_code": "cc"},
                        {"value": "A0006", "text": "深赛尔", "easy_code": "sse"},
                        {"value": "A0007", "text": "德宝", "easy_code": "db"},
                        {"value": "A0008", "text": "安监国", "easy_code": "ajg"},
                        {"value": "A0009", "text": "联想", "easy_code": "lx"},
                        {"value": "A00010", "text": "格力", "easy_code": "gl"},
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
