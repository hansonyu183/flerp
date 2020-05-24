import 'package:flerp/models/index.dart';

import 'package:flutter/material.dart';
import 'package:flerp/icon.dart';

typedef MenuCallBack = void Function(UserPage);

class JsonMenu extends StatelessWidget {
  JsonMenu({Key key, this.userData, this.onTap, this.onExpend}) : super(key: key);
  final UserData userData ;
  final MenuCallBack onTap; //声明函数对象
  final VoidCallback onExpend;
  
  @override
  Widget build(BuildContext context) {
    return userData == null ? Text("null") : genMenu(userData);
  }

  ListView genMenu(UserData userData) {
    List<Widget> menuBody = genList(userData.modules);
    ListTile menuHeader = ListTile(
      title: Icon(Icons.menu),
      onTap: onExpend,
    );

    ListView menu = ListView(children: [menuHeader, ...menuBody]);
    return menu;
  }

  List<Widget> genList(List<UserModule> modules) {
    return modules.map((module) {
        List<Widget> pagemenu = [];
        if (module.pages!=null)
          pagemenu=genItem(module.pages);
        if (module.modules != null)
          pagemenu.addAll(genList(module.modules));
        return ExpansionTile(
          children: pagemenu,
          title: Text(module.name),
        );
    }).toList();
  }
  
  List<Widget> genItem(List<UserPage> pages) {
    return pages.map((page){
        return  ListTile(
        leading: Icon(getIcon()),
        title: InkWell(
          onTap:()=> onTap(page),
          child: Text(page.title),
          splashColor: Colors.green,
        ));
      }
    ).toList();
  }  
}