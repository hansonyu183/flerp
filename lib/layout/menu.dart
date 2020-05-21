import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flerp/icon.dart';

const String _menuJson = '''[
      {"title":"基础资料",
        "children":[
          {"title":"客户资料","page":"BaseEbaEditor"},
          {"title":"产品资料","page":"BaseResEditor"},
          {"title":"供应商资料","page":"BaseSupEditor"}
        ]},
      {"title":"Test","children":[
          {"title":"testPage1","page":"testPage1"},
          {"title":"testPage2","page":"testPage2"},
          {"title":"menu 4-3","children":[
            {"title":"menu 4-3-1"},
            {"title":"menu 4-3-2"}
          ]}
      ]}
    ]''';

typedef MenuCallBack = void Function(String title, String pageName);
typedef ExpandCallBack = void Function();

class JsonMenu extends StatelessWidget {
  JsonMenu({Key key, this.json=_menuJson, this.onTap, this.onExpnd}) : super(key: key);
  final String json ;
  final MenuCallBack onTap; //声明函数对象
  final ExpandCallBack onExpnd;
  
  @override
  Widget build(BuildContext context) {
    return json == null ? Text("null") : genMenu(json);
  }

  ListView genMenu(String json) {
    List<Widget> menuBody = genList(jsonDecode(json));

    ListTile menuHeader = ListTile(
      title: Icon(Icons.menu),
      onTap: onExpnd,
    );

    ListView menu = ListView(children: [menuHeader, ...menuBody]);
    return menu;
  }

  List<Widget> genList(List data) {
    List<Widget> menuBody = data.map((item) {
      if (item['children'] != null) {
        return ExpansionTile(
          children: genList(item['children']),
          title: Text(item['title']),
        );
      } else {
        return Listitem(
          title: item['title'],
          page: item['page'],
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
