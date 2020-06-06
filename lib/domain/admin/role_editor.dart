import 'package:flerp/app/models/index.dart';
import 'package:flerp/domain/admin/role_editor_m.dart';
import 'package:flutter/material.dart';

import 'children/admin_modules_menu.dart';
import 'children/role_menu.dart';
import 'role_editor_vm.dart';

class RoleEditor extends StatefulWidget {
  const RoleEditor({Key key, this.adminModules}) : super(key: key);
  //final List<Role> roles;
  final List<Module> adminModules;
  @override
  _RoleEditorState createState() => _RoleEditorState();
}

class _RoleEditorState extends State<RoleEditor> {
  @override
  Widget build(BuildContext context) {
    //layoutVm.initFirstPage(widget.userData.modules.last.pages.last);
    final RoleEditorVM vm=RoleEditorVM(context);

    final Widget roleMenu = vm.build((BuildContext ctx, RoleEditorM state) {
      return
        RoleMenu(roles: state.roles, onSelected: (int role) => print(role),onDeleted:vm.onDeleteRole);},
    memo: (RoleEditorM s) => <dynamic>[s.roles]);

    final Widget adminModules = AdminModulesMenu(
        modules: getAdminModules(), onTap: (UserPage index) => print('index'));


    return Scaffold(
      backgroundColor: Colors.grey,
      body: Row(children: <Widget>[
         Expanded(
           flex: 1,
           child:
        Column(children: <Widget>[
          Row(children: <Widget>[
            IconButton(
              icon: const Icon(Icons.group_add),
              onPressed: () => vm.newRoleItem(),
            ),
            IconButton(
              icon: const Icon(Icons.save),
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

    return <Module>[
      adminM,
      base,
      res,
      bankNote,
      testUserPage,
    ];
  }
}
