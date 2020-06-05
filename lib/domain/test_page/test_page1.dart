import 'package:flutter/material.dart';
import 'package:flerp/core/widgets/index.dart';
import 'package:flutter/rendering.dart';
import '../models/index.dart';

 VouData testVouData=VouData(
  vouId: 1,
  vouNo: "TS-20200525-001",
  vouDate: "20200525",
  vouAmo: "0",
  eba: Eba(ebaId: "A0001",ebaName: "深圳市世纪华彩有限公司",easyCode: "szssjhcyxgs"),
  sup: Sup(supId: "B0001",supName: "惠州市利而安化工有限公司",easyCode: "hzsleahgyxgs"),
  srcAccount: Account(accountId: "M001",accountName: "中行",easyCode: "zh"),
  targAccount:  Account(accountId: "M002",accountName: "工行",easyCode: "gh"),
  ioAmo: "1000.00",
  jsonItemList: '[{"name":"Ram","email":"ram@gmail.com","age":23,"DOB":"1990-12-01"},'
                            '{"name":"Shyam","email":"shyam23@gmail.com","age":18,"DOB":"1995-07-01"},'
                            '{"name":"John","email":"john@gmail.com","age":10,"DOB":"2000-02-24"},'
                            '{"name":"Ram","age":12,"DOB":"2000-02-01"}]'

);

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

  VouData _vouData; 
  @override
  Widget build(BuildContext context) {
    _vouData=testVouData;
    return Form(
        key: _formKey,
        child: Column(children: [
          Row(children: [
          ViewAction(onAction: ()=>print("action"),),
        
          UpdateAction(actionState: ActionEnum.notSaved,),
          ],),
          Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.topLeft,
                  child: Row( children: [
                    DatePicker(
                      label: "日期",
                      initialDate: _vouData.vouDate,
                      onEditingComplete: (String value) => print(value),
                      onSaved: (String v) => _fromValues['date'] = v,
                    ),
                    VouNo(
                        initialValue: _vouData.vouNo),
                  ]))),
          Expanded(
              flex: 1,
              child: Container(
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
                      label: "合计金额",
                      enabled: false,
                      initialValue: _fromValues['amount'],
                      onSaved: (String v) => _fromValues['amount'] = v,
                    ),
                  ]))),
          Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.topLeft,
                  child: Row( children: [
                    DropDownField(
                      label: "付款账户",
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
                      label: "收款账户",
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
              child: Container(
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
