import 'package:flutter/material.dart';
import '../../json_form/json_form.dart';

class AccountID extends StatelessWidget {
  const AccountID(
      {Key key,
      this.initList = const <Map<String, dynamic>>[
        <String, dynamic>{'value': 0, 'text': '无数据', 'easy_code': ''}
      ]})
      : super(key: key);
  final List<Map<String, dynamic>> initList;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: DropDownField(
      label: '客户',
      iconDate: Icons.account_box,
    ));
  }
}
