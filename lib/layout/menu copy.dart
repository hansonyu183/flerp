import 'package:flutter/material.dart';
import 'package:flerp/icon.dart';
import 'package:flerp/models/menu.dart';
import 'package:flerp/models/menu_item.dart';

typedef MenuCallBack = void Function(String title, String pageName);
typedef ExpandCallBack = void Function();

class JsonMenu extends StatelessWidget {
  JsonMenu({Key key, this.menuMod, this.onTap, this.onExpnd}) : super(key: key);
  final Menu menuMod ;
  final MenuCallBack onTap; //声明函数对象
  final ExpandCallBack onExpnd;
  
  @override
  Widget build(BuildContext context) {
    return menuMod == null ? Text("null") : genMenu(menuMod);
  }

  ListView genMenu(Menu menuMod) {
    List<Widget> menuBody = genList(menuMod.children);

    ListTile menuHeader = ListTile(
      title: Icon(Icons.menu),
      onTap: onExpnd,
    );

    ListView menu = ListView(children: [menuHeader, ...menuBody]);
    return menu;
  }

  List<Widget> genList(List<MenuItem> data) {
    List<Widget> menuBody = data.map((item) {
      if (item.children != null) {
        return ExpansionTile(
          children: genList(item.children),
          title: Text(item.title),
        );
      } else {
        return Listitem(
          title: item.title,
          page: item.page,
          onTap: onTap,
        );
      }
    }).toList();
    return menuBody;
  }
}

class Listitem extends StatelessWidget {
  Listitem({Key key, this.title, this.page, this.onTap}) : super(key: key);
  final String title;
  final String page;
  final MenuCallBack onTap; //声明函数对象

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(getIcon()),
        title: InkWell(
          onTap: _onTap,
          child: Text(title),
          splashColor: Colors.green,
        ));
  }

  void _onTap() {
    onTap(title, page);
  }
}
