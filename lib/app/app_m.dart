import 'models/index.dart';

class AppM {
  User user;

  AppM();

  AppM.admin() {
    AppM();
    this.user = _getAdmin();
  }
  
  User _getAdmin() {
    int _id = 1;
        Module adminM = Module(id: _id++, name: "系统管理", pages: [
      UserPage(name: PageEnum.roleEditor),
    ]);

    Module base = Module(id: _id++, name: "基础资料", pages: [
      UserPage(name: PageEnum.baseEbaEditor),
      UserPage(name: PageEnum.baseResEditor),
      UserPage(name: PageEnum.baseSupEditor),
    ]);

    Module res = Module(id: _id++, name: "库存", pages: [
      UserPage(name: PageEnum.resIn),
    ]);

    Module bankNote = Module(id: _id++, name: "票据处理", pages: [
      UserPage(name: PageEnum.bankNoteVou),
    ]);

    Module testUserPage = Module(id: _id++, name: "测试", pages: [
      UserPage(name: PageEnum.testPage1),
    ]);

    Role admin = Role(id: 1, name: "admin", modules: [
      adminM,
      base,
      res,
      bankNote,
      testUserPage,
    ]);
    User userData = User(
        name: "hanson",
        role: admin,
        firstPage: UserPage(name: PageEnum.testPage1));
    return userData;
  }
}
