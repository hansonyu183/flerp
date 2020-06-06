import 'package:flutter/material.dart';
import 'package:flerp/core/widgets/erp_widgets/erp_widgets.dart';
import 'package:flerp/core/widgets/json_form/json_form.dart';

class BankNoteVou extends StatefulWidget {
  const BankNoteVou({Key key}) : super(key: key);
  static String pageTitle = '票据处理单';
  @override
  _BankNoteVouState createState() => _BankNoteVouState();
}

class _BankNoteVouState extends State<BankNoteVou> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _fromValues = <String, String>{
    // Key:    Value
    'date': DatePicker.dateToString(DateTime.now()),
    'amount': '0',
  };

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          Row(children: <Widget>[
            const ActionButton.print(),
            const ActionButton.add(),
            ActionButton.save(onPressed: () {}),
            const ActionButton.check(),
          ]),
          Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Wrap(runSpacing: 6, children: <Widget>[
                    DatePicker(
                      label: '日期',
                      initialDate: _fromValues['date'],
                      onSaved: (String v) => _fromValues['date'] = v,
                    ),
                    LabelField(
                      iconData: Icons.monetization_on,
                      label: '金额',
                      initialValue: _fromValues['amount'],
                      onSaved: (String v) => _fromValues['amount'] = v,
                    ),
                    DropDownField(
                      label: '客户',
                      iconDate: Icons.account_box,
                      dataList: <DropDownData>[/* cSpell:disable */
                        DropDownData('A0001', '高精有限公司', 'gjyxgs'),
                        DropDownData('A0001', '高精有限公司', 'gjyxgs'),
                        DropDownData('A0002', '工商银行', 'gsyh'),
                        DropDownData('A0003', '坤洋实业', 'kysy'),
                        DropDownData('A0004', '刘诚', 'lc'),
                        DropDownData('A0005', '赐彩', 'cc'),
                        DropDownData('A0006', '深赛尔', 'cse'),
                      ],
                    ),
                    const JsTable(
                        jsonData:
                            '[{"name":"Ram","email":"ram@gmail.com","age":23,"DOB":"1990-12-01"},'
                            '{"name":"Sham","email":"shyam23@gmail.com","age":18,"DOB":"1995-07-01"},'
                            '{"name":"John","email":"john@gmail.com","age":10,"DOB":"2000-02-24"},'
                            '{"name":"Ram","age":12,"DOB":"2000-02-01"}]')
                  ]))),
        ]));
  }
}
