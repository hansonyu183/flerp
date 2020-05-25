import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flerp/models/respone_body.dart';
import './register.dart';
import './login_vm.dart';
import 'package:flerp/api/user_api.dart';
import 'package:flerp/models/user.dart';
import 'package:flerp/utils/globalUtil.dart';
import 'package:flerp/layout/layout.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State {
  static final String path = "lib/src/pages/login/login2.dart";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  User user = new User();
  String error = "";
  String password2 = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPageContent(),
    );
  }

  Widget buildPageContent() {
    return Container(
        alignment: Alignment.center,
        color: Colors.grey,
        child: Form(
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
                    maxHeight: 400,
                    maxWidth: 500,
                    minHeight: 200,
                    minWidth: 100),
                child: loginConsumer.build(
                  (ctx, state) {
                    return state.isRegisterFrom
                        ? buildRegister()
                        : buildLogin();
                  },
                  memo: (s) => [s.isRegisterFrom],
                ))));
  }

  Column buildLogin() {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.spaceEvenly, //MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.person,
          size: 50,
        ),
        TextFormField(
          initialValue: user.userName,
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
            user.userName = v;
          },
          validator: (v) {
            return v.isEmpty ? "请输入用户名" : null;
          },
        ),
        TextFormField(
          initialValue: user.password,
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
            user.password = v;
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
            FlatButton(
              child: Text(
                "忘记密码",
              ),
              onPressed: () {},
            )
          ],
        ),
      ],
    );
  }

  Column buildRegister() {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.spaceEvenly, //MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.person,
          size: 50,
        ),
        TextFormField(
          initialValue: user.userName,
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
            user.userName = v;
          },
          validator: (v) {
            return v.isEmpty ? "请输入用户名" : null;
          },
        ),
        TextFormField(
          initialValue: user.password,
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
            user.password = v;
          },
          validator: (v) {
            return v.isEmpty ? "请输入密码" : null;
          },
        ),
        TextFormField(
          style: TextStyle(color: Colors.black),
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            // helperText: '两次密码必须一致',
            labelText: "确认密码",
          ),
          onSaved: (v) {
            password2 = v;
          },
          validator: (v) {
            return password2 == user.password ? null : "两次密码必须一致";
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
                onPressed: () => loginVm.switchRegister()),
          ],
        ),
      ],
    );
  }
}

/*
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
