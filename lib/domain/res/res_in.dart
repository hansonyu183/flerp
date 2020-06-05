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
                    DropDownField(
                      label: "供应商",
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
