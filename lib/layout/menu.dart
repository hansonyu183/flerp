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
    List<Widget> menuBody = modules.map((module) {
      if (module.modules != null) {
        return ExpansionTile(
          children: genList(module.modules),
          title: Text(module.name),
        );
      } else {
        return genItem(module.pages);
      }
    }).toList();
    return menuBody;
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