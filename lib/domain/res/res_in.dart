import 'package:flutter/material.dart';
import 'package:flerp/core/widgets/index.dart';
import 'package:intl/intl.dart';

class ResIn extends StatefulWidget {
  @override
  ResInState createState() => ResInState();
}

class ResInState extends State<ResIn> {
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
          ViewAction(onAction: ()=>print("action"),),
        
          UpdateAction(actionState: ActionEnum.notSaved,),
          ],),
          Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Row( children: [
                    VouNo(
                        initialValue: "AF-" +
                            DateFormat("yyyyMMdd").format(DateTime.now()) +
                            "-001"),
                    DatePicker(
                      label: "日期",
                      initialDate: _fromValues['date'],
                      onEditingComplete: (String value) => print(value),
                      onSaved: (String v) => _fromValues['date'] = v,
                    ),
                  ]))),
          Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Row( children: [
                    DropDownField(
                      label: "客户",
                      iconDate: Icons.account_box,
                      dataList: [
                        DropDownData('A0001', '高精有限公司', 'gjyxgs'),
                        DropDownData('A0001', '高精有限公司', 'gjyxgs'),
                        DropDownData('A0002', '工商银行', 'gsyh'),
                        DropDownData('A0003', '坤洋实业', 'kysy'),
                        DropDownData('A0004', '刘诚', 'lc'),
                        DropDownData('A0005', '赐彩', 'cc'),
                        DropDownData('A0006', '深赛尔', 'cse'),
                      ],
                    ),
                    DropDownField(
                      label: "供应商",
                      iconDate: Icons.account_box,
                      dataList: [
                        DropDownData('A0001', '高精有限公司', 'gjyxgs'),
                        DropDownData('A0001', '高精有限公司', 'gjyxgs'),
                        DropDownData('A0002', '工商银行', 'gsyh'),
                        DropDownData('A0003', '坤洋实业', 'kysy'),
                        DropDownData('A0004', '刘诚', 'lc'),
                        DropDownData('A0005', '赐彩', 'cc'),
                        DropDownData('A0006', '深赛尔', 'cse'),
                      ],
                    ),
                    LabelField(
                      iconData: Icons.monetization_on,
                      label: "金额",
                      initialValue: _fromValues['amount'],
                      onSaved: (String v) => _fromValues['amount'] = v,
                    ),
                  ]))),
          Expanded(
              flex: 8,
              child: Align(
                  alignment: Alignment.topLeft,
                  child: 
                  JsTable(
                        jsonData:
                            '[{"name":"Ram","email":"ram@gmail.com","age":23,"DOB":"1990-12-01"},'
                            '{"name":"Shyam","email":"shyam23@gmail.com","age":18,"DOB":"1995-07-01"},'
                            '{"name":"John","email":"john@gmail.com","age":10,"DOB":"2000-02-24"},'
                            '{"name":"Ram","age":12,"DOB":"2000-02-01"}]')
          )),]
        ));
  }
}
