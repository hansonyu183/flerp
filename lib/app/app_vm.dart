import 'package:flutter/material.dart';

import 'package:flerp/core/view_models/view_model.dart';
import 'app_m.dart';

class AppVm extends ViewModel<AppM> {
  AppVm(BuildContext viewCtx):super(viewCtx,AppM.admin());

  void logout() {
    setState((AppM s) => s.user = null);
  }

  void login(String userName, String passWord)  {
    /* var cancelToast =
        BotToast.showLoading(duration: Duration(milliseconds: 3000));

    //var data = await UserData.fromServer(userName, passWord);
    var data=AppModules().defaultUserData;
    if (data.modules != null) {
      //await fetchEbas();
      appConsumer.setState((s) => s.userData = data);
    } else {
      BotToast.showText(text: '用户未授权');
    }
    cancelToast();

    //RespondBody respondBody = await UserApi.login({"name":userName,"passWord":passWord});*/
    return ;
  }

  void register(String userName, String passWord)  {
    //UserData.register(userName, passWord);
    //AppVm.login();
  }
}
