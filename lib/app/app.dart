import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';

import 'layout/layout.dart';
import 'login/login.dart';
import 'app_vm.dart';

class App extends StatelessWidget{
  App({Key key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var appVm = AppVm(context);
    return MaterialApp(
       builder: BotToastInit(), //1.调用BotToastInit
        navigatorObservers: [BotToastNavigatorObserver()], //2.注册路由观察者
        title: '坤洋ERP',
        theme: ThemeData.light(),
        home: appVm.build(
          (ctx, state) {
            return null == state.user
                ? Login(
                    appTitle: '坤洋ERP',
                    onLogin: appVm.login,
                    onRegister: appVm.register,
                  )
                : Layout(appTitle: '坤洋ERP',onLogout: appVm.logout,user: state.user,);
          },
          memo: (s) => [s.user],
        ));
  }
}
