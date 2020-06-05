import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key, this.appTitle, this.onLogin, this.onRegister})
      : super(key: key);
  final String appTitle;
  final void Function(String userName, String passWord) onLogin;
  final void Function(String userName, String passWord) onRegister;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String userName, passWord;
  bool isRegisterFrom = false;

  Widget buildConfirmPassword() {
    return isRegisterFrom
        ? TextFormField(
            style: TextStyle(color: Colors.black),
            obscureText: true,
            autovalidate: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                // helperText: '两次密码必须一致',
                labelText: "确认密码",
                icon: Icon(Icons.lock_outline)),
            onSaved: (v) {},
            validator: (v) {
              return v == passWord ? null : "两次密码必须一致";
            },
          )
        : Text("");
  }

  Widget buildButton() {
    var text1 = isRegisterFrom ? "注 册" : "登 录";
    var text2 = isRegisterFrom ? "重新登录" : "注册账号";
    var _onPressed = isRegisterFrom ? widget.onRegister : widget.onLogin;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FlatButton(
          child: Text(
            text1,
          ),
          onPressed: () => _onPressed(userName,passWord),
        ),
        FlatButton(
          child: Text(
            text2,
          ),
          onPressed: () {
            setState(() {
              isRegisterFrom = !isRegisterFrom;
            });
          },
        ),
      ],
    );
  }

  Form buildForm() {
    return Form(
        key: formKey,
        child: Container(
            padding: EdgeInsets.all(40.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            constraints: BoxConstraints(
                maxHeight: 400, maxWidth: 500, minHeight: 200, minWidth: 100),
            child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, //MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    size: 50,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "请输入用户名",
                      icon: Icon(
                        Icons.people,
                        //color: Colors.blue,
                      ),
                    ),
                    onSaved: (v) {},
                    onFieldSubmitted: (v) {
                      userName = v;
                    },
                    validator: (v) {
                      return v.isEmpty ? "请输入用户名" : null;
                    },
                  ),
                  TextFormField(
                    autovalidate: true,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "请输入密码",
                      icon: Icon(
                        Icons.lock_open,
                        //color: Colors.blue,
                      ),
                    ),
                    onSaved: (v) {},
                    validator: (v) {
                      passWord = v;
                      return v.isEmpty ? "请输入密码" : null;
                    },
                  ),
                  buildConfirmPassword(),
                  buildButton()
                ])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
       /* appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(widget.appTitle),
        ),*/
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.appTitle),
      ),
        body: Container(alignment: Alignment.center, child: buildForm()));
  }
}

/*

                          loginConsumer.build(
                            (ctx, state) {
                              return state.isRegisterFrom
                                  ? RegisterForm(
                                      onSwitchLogin: () =>
                                          loginVm.switchLogin(),
                                    )
                                  : LoginForm(
                                      onLogin: (n, p) => loginVm.login(n, p),
                                      onSwitchRegister: () =>
                                          loginVm..switchRegister(),
                                    );
                            },
                            memo: (s) => [s.isRegisterFrom],
                          ),


class LoginForm extends StatelessWidget {
  const LoginForm({Key key,this.onLogin,this.onSwitchRegister}) : super(key: key);
  final void Function(String userName,String passWord) onLogin;
  final VoidCallback onSwitchRegister;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.spaceEvenly, //MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.person,
          size: 50,
        ),
        TextFormField(
          initialValue: loginMod.userName,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "请输入用户名",
            icon: Icon(
              Icons.people,
              //color: Colors.blue,
            ),
          ),
          onSaved: (v) {
            loginMod.userName = v;
          },
          validator: (v) {
            return v.isEmpty ? "请输入用户名" : null;
          },
        ),
        TextFormField(
          initialValue: loginMod.password,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "请输入密码",
            icon: Icon(
              Icons.lock,
              //color: Colors.blue,
            ),
          ),
          onSaved: (v) {
            loginMod.password = v;
          },
          validator: (v) {
            return v.isEmpty ? "请输入密码" : null;
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              child: Text(
                "登 录",
              ),
              onPressed: () => loginVm.login(),
            ),
            FlatButton(
              child: Text(
                "注 册",
              ),
              onPressed: () => loginVm.switchRegister(),
            ),
          ],
        ),
      ],
    );
  }
}


class RegisterForm extends StatelessWidget {
  const RegisterForm({Key key,this.initUserName="",this.initPassWord="",this.onRegister,this.onSwitchLogin}) : super(key: key);
  final void Function(String userName,String passWord) onRegister;
  final void Function(String userName,String passWord) onSwitchLogin;
  final String initUserName,initPassWord;
  @override
  Widget build(BuildContext context) {
    String password1 = "";
    String password2 = "";
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.spaceEvenly, //MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.person,
          size: 50,
        ),
        TextFormField(
          initialValue: initUserName,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "请输入用户名",
            icon: Icon(
              Icons.people,
              //color: Colors.blue,
            ),
          ),
          onSaved: (v) {
            loginMod.userName = v;
          },
          validator: (v) {
            return v.isEmpty ? "请输入用户名" : null;
          },
        ),
        TextFormField(
          initialValue: initUserName,
          autovalidate: true,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "请输入密码",
            icon: Icon(
              Icons.lock_open,
              //color: Colors.blue,
            ),
          ),
          onFieldSubmitted: (v){
            password1 = v;
          },
          onSaved: (v) {
          },
          validator: (v) {
            return v.isEmpty ? "请输入密码" : null;
          },
        ),
        TextFormField(
          style: TextStyle(color: Colors.black),
          obscureText: true,
          autovalidate: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              // helperText: '两次密码必须一致',
              labelText: "确认密码",
              icon: Icon(Icons.lock_outline)),              
          onSaved: (v) {
            password2 = v;
          },
          validator: (v) {
            return password2 == password1 ? null : "两次密码必须一致";
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              child: Text(
                "注 册",
              ),
              onPressed: () => loginVm.register(),
            ),
            FlatButton(
                child: Text(
                  "重新登录",
                ),
                onPressed: () => loginVm.switchLogin()),
          ],
        ),
      ],
    );
  }
}

  register() {
    var form = formKey.currentState;
    form.save();
    if (form.validate()) {
      UserApi.register(user.toJson()).then((v) {
        login();
        BotToast.showText(text: "S.of(context).registerSuccess");
      });
    }
  }

  register() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => Register()),
    );
  }

 login() {
    var form = formKey.currentState;
    if (!form.validate()) {
      return;
    }
    form.save();
    UserApi.login(user.toJson()).then((ResponeBody responeBody) {
      if (responeBody.success) {
        GlobalUtil.token = responeBody.data;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => Layout()),
        );
      } else {
        this.error = responeBody.message;
        BotToast.showText(text: this.error);
        setState(() {});
      }
    }).catchError((e) {
      error = e;
      setState(() {});
    });
  }*/
