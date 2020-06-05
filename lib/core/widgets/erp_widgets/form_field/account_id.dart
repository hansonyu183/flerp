import 'package:flutter/material.dart';
import '../../json_form/json_form.dart';

const List defaultList = [
  {"value": 0, "text": "无数据", "easy_code": ""}
];

class AccountID extends StatelessWidget {
  const AccountID({Key key, this.initList = defaultList}) : super(key: key);
  final List initList;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: DropDownField(
      label: "客户",
      iconDate: Icons.account_box,
    ));
  }
}
