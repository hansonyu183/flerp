import 'package:flerp/models/index.dart';

import 'package:flerp/modules/base/index.dart';
import 'package:flerp/modules/res/index.dart';
import 'package:flerp/modules/banknote/index.dart';
import 'package:flerp/modules/testPage/index.dart';


class AppModules {
  AppModules();
    
  UserData get defaultUserData => _getDefaultUserData();

  UserData _getDefaultUserData(){
    int _id=1;
    UserModule base =UserModule(id: _id++,name: "基础资料",modules: [
      UserModule(id: _id++,name: "客户资料",pages: [
        UserPage(id: _id++,name: "BaseEbaEditor",title: "客户编辑",buildWidget: ()=>BaseEbaEditor()),
      ]),

      UserModule(id: _id++,name: "商品资料",pages: [
        UserPage(id: _id++,name: "BaseResEditor",title: "商品编辑",buildWidget: ()=>BaseResEditor()),
      ]),

      UserModule(id: _id++,name: "供应商资料",pages: [
        UserPage(id: _id++,name: "BaseSupEditor",title: "供就商编辑",buildWidget: ()=>BaseSupEditor()),
      ]),
    ]);

    UserModule res =UserModule(id: _id++,name: "库存",pages: [
        UserPage(id: _id++,name: "ResIn",title: "入库单",buildWidget: ()=>ResIn()),
      ]);

    UserModule bankNote =UserModule(id: _id++,name: "票据处理",pages: [
      UserPage(id: _id++,name: "BankNoteVou",title: "进账单",buildWidget: ()=>BankNoteVou()),
    ]);

    UserModule testPage =UserModule(id: _id++,name: "测试",pages: [
      UserPage(id: _id++,name: "TestPage1",title: "测试页",buildWidget: ()=>TestPage1()),
    ]);

    UserData userData = UserData(id:0,name: "hanson",role: "admin",modules: [
      base,
      res,
      bankNote,
      testPage,
    ]);
    print(userData.toJson());
    return userData;
  }
}