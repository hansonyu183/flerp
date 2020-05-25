import 'package:consumer/consumer.dart';

import 'package:flerp/models/index.dart';
import 'package:flerp/modules/app_modules.dart';

class _State {
  UserData userData;
  _State();

}

var appConsumer = Consumer(_State());

class LoginVm{
  LoginVm();

  void logout(){
    appConsumer.setState((s) => s.userData=null);
  }

  void login(){
    appConsumer.setState((s) => s.userData=AppModules().defaultUserData);
  }
}

var appVm = LoginVm();