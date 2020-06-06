import 'package:bot_toast/bot_toast.dart';
import 'package:flerp/app/app_m.dart';
import 'package:flutter/material.dart';

import 'app_vm.dart';
import 'layout/layout.dart';
import 'login/login.dart';

class App extends StatelessWidget{
  const App({Key key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AppVm appVm = AppVm(context);
    return MaterialApp(
       builder: BotToastInit(), //1.调用BotToastInit
        navigatorObservers: <NavigatorObserver>[BotToastNavigatorObserver()], //2.注册路由观察者
        title: '坤洋ERP',
        theme: ThemeData.light(),
        home: appVm.build(
          (BuildContext ctx, AppM state) {
            if (null == state.user) {
              return Login(
                    appTitle: '坤洋ERP',
                    onLogin: appVm.login,
                    onRegister: appVm.register,
                  );
            } else {
              return Layout(appTitle: '坤洋ERP',onLogout: appVm.logout,user: state.user,);
            }
          },
          memo: (AppM s) => <dynamic> [s.user],
        ));
  }
}
