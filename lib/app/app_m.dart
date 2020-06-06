import 'models/index.dart';

class AppM {
    AppM();
  AppM.admin() {
    AppM();
    user = _getAdmin();
  }
  User user;


  
  User _getAdmin() {
    int _id = 1;
        final Module adminM = Module(id: _id++, name: '系统管理', pages: <UserPage>[
      UserPage(name: PageEnum.roleEditor),
    ]);

    final Module base = Module(id: _id++, name: '基础资料', pages: <UserPage>[
      UserPage(name: PageEnum.baseEbaEditor),
      UserPage(name: PageEnum.baseResEditor),
      UserPage(name: PageEnum.baseSupEditor),
    ]);

    final Module res = Module(id: _id++, name: '库存', pages: <UserPage>[
      UserPage(name: PageEnum.resIn),
    ]);

    final Module bankNote = Module(id: _id++, name: '票据处理', pages: <UserPage>[
      UserPage(name: PageEnum.bankNoteVou),
    ]);

    final Module testUserPage = Module(id: _id++, name: '测试', pages: <UserPage>[
      UserPage(name: PageEnum.testPage1),
    ]);

    final Role admin = Role(id: 1, name: 'admin', modules: <Module>[
      adminM,
      base,
      res,
      bankNote,
      testUserPage,
    ]);
    final User userData = User(
        name: 'hanson',
        role: admin,
        firstPage: UserPage(name: PageEnum.testPage1));
    return userData;
  }
}
