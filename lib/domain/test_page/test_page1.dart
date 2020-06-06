import 'package:flutter/material.dart';
import 'package:flerp/core/widgets/index.dart';
import 'package:flutter/rendering.dart';
import '../models/index.dart';

 VouData testVouData=VouData(
  vouId: 1,
  vouNo: 'TS-20200525-001',
  vouDate: '20200525',
  vouAmo: '0',
 /* cSpell:disable */ eba: Eba(ebaId: 'A0001',ebaName: '深圳市世纪华彩有限公司',easyCode: 'szssjhcyxgs'),
  sup: Sup(supId: 'B0001',supName: '惠州市利而安化工有限公司',easyCode: 'hzsleahgyxgs'),
  srcAccount: Account(accountId: 'M001',accountName: '中行',easyCode: 'zh'),
  targeAccount:  Account(accountId: 'M002',accountName: '工行',easyCode: 'gh'),
  ioAmo: '1000.00',
  jsonItemList: '[{"name":"Ram","email":"ram@gmail.com","age":23,"DOB":"1990-12-01"},'
                            '{"name":"Sham","email":"shyam23@gmail.com","age":18,"DOB":"1995-07-01"},'
                            '{"name":"John","email":"john@gmail.com","age":10,"DOB":"2000-02-24"},'
                            '{"name":"Ram","age":12,"DOB":"2000-02-01"}]'

);

class TestPage1 extends StatefulWidget {
  @override
  TestPage1State createState() => TestPage1State();
}

class TestPage1State extends State<TestPage1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _fromValues = <String, String>{
    // Key:    Value
    'date': DatePicker.dateToString(DateTime.now()),
    'amount': '0',
  };

  VouData _vouData; 
  @override
  Widget build(BuildContext context) {
    _vouData=testVouData;
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          Row(children: <Widget>[
          ViewAction(onAction: ()=>print('action'),),
        
          const UpdateAction(actionState: ActionEnum.notSaved,),
          ],),
          Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.topLeft,
                  child: Row( children: <Widget>[
                    DatePicker(
                      label: '日期',
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
                  child: Row( children: <Widget>[
                    DropDownField(
                      label: '客户',
                      iconDate: Icons.account_box,
                      dataList: <DropDownData>[
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
                      label: '供应商',
                      iconDate: Icons.account_box,
                      dataList: <DropDownData>[
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
                      label: '合计金额',
                      enabled: false,
                      initialValue: _fromValues['amount'],
                      onSaved: (String v) => _fromValues['amount'] = v,
                    ),
                  ]))),
          Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.topLeft,
                  child: Row( children: <Widget>[
                    DropDownField(
                      label: '付款账户',
                      iconDate: Icons.account_box,
                      dataList: <DropDownData>[
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
                      label: '收款账户',
                      iconDate: Icons.account_box,
                      dataList:  <DropDownData>[
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
                      label: '金额',
                      initialValue: _fromValues['amount'],
                      onSaved: (String v) => _fromValues['amount'] = v,
                    ),
                  ]))),
          Expanded(
              flex: 8,
              child: Container(
                  alignment: Alignment.topLeft,
                  child: 
                  const JsTable(
                        jsonData:
                            '[{"name":"Ram","email":"ram@gmail.com","age":23,"DOB":"1990-12-01"},'
                            '{"name":"Sham","email":"shyam23@gmail.com","age":18,"DOB":"1995-07-01"},'
                            '{"name":"John","email":"john@gmail.com","age":10,"DOB":"2000-02-24"},'
                            '{"name":"Ram","age":12,"DOB":"2000-02-01"}]')
          )),]
        ));
  }
}
