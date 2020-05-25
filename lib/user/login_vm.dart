import 'package:consumer/consumer.dart';

import 'package:flerp/app/app_vm.dart';

class _State {
  bool isRegisterFrom=false;
  _State();
}

var loginConsumer = Consumer(_State());

class LoginVm{
  LoginVm();

  void switchRegister(){
    loginConsumer.setState((s) => s.isRegisterFrom=true);
  }

  void switchLogin(){
    loginConsumer.setState((s) => s.isRegisterFrom=false);
  }

  void login(){
    appVm.login();
  }

  void register(){
    //appVm.login();
  }
}

var loginVm = LoginVm();