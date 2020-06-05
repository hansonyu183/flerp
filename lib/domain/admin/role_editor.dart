import 'package:flutter/material.dart';

import 'package:flerp/app/models/index.dart';
import 'children/role_menu.dart';
import 'children/admin_modules_menu.dart';
import 'role_editor_vm.dart';

class RoleEditor extends StatefulWidget {
  RoleEditor({Key key, this.adminModules}) : super(key: key);
  //final List<Role> roles;
  final List<Module> adminModules;
  @override
  _RoleEditorState createState() => _RoleEditorState();
}

class _RoleEditorState extends State<RoleEditor> {
  @override
  Widget build(BuildContext context) {
    //layoutVm.initFirstPage(widget.userData.modules.last.pages.last);
    var vm=RoleEditorVM(context);

    Widget roleMenu = vm.build((ctx, state) {
      return
        RoleMenu(roles: state.roles, onSelected: (role) => print(role),onDeleted:vm.onDeleteRole);},
    memo: (s) => [s.roles]);

    Widget adminModules = AdminModulesMenu(
        modules: getAdminModules(), onTap: (index) => print("index"));


    return Scaffold(
      backgroundColor: Colors.grey,
      body: Row(children: <Widget>[
         Expanded(
           flex: 1,
           child:
        Column(children: [
          Row(children: [
            IconButton(
              icon: Icon(Icons.group_add),
              onPressed: () => vm.newRoleItem(),
            ),
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () => vm.saveRoles(),
            ),
          ],),
          roleMenu,
        ])),
        Expanded(flex:1,child: adminModules),
      ]),
    );
  }

  List<Module> getAdminModules() {
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

    return [
      adminM,
      base,
      res,
      bankNote,
      testUserPage,
    ];
  }
}
