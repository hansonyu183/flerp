import 'package:flutter/material.dart';
import './app_vm.dart';
import 'package:flerp/layout/layout.dart';
import 'package:flerp/user/login.dart';

class AppV extends StatelessWidget {
  const AppV({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '坤洋ERP',
        theme: ThemeData.light(),
        home: appConsumer.build(
          (ctx, state) {
            return null == state.userData ? Login() : Layout(appTitle: '坤洋ERP');
          },
          memo: (s) => [s.userData],
        ));
  }
}