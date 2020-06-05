import 'package:flutter/material.dart';
import 'package:flerp/app/models/index.dart';

class AdminModulesMenu extends StatefulWidget {
  AdminModulesMenu({Key key, this.modules, this.onTap}) : super(key: key);
  final List<Module> modules;
  final void Function(UserPage) onTap;
  @override
  _AdminModulesMenuState createState() => _AdminModulesMenuState();
}

class _AdminModulesMenuState extends State<AdminModulesMenu> {
  @override
  Widget build(BuildContext context) {
    return widget.modules == null ? Text("null") : genMenu(widget.modules);
  }

  ListView genMenu(List<Module> modules) {
    return ListView(children: genList(modules));
  }

  List<Widget> genList(List<Module> modules) {
    return modules.map((module) {
      List<Widget> pagemenu = [];
      if (module.pages != null) pagemenu = genItem(module.pages);
      if (module.modules != null) pagemenu.addAll(genList(module.modules));
      return ExpansionTile(
        children: pagemenu,
        title: Text(module.name),
      );
    }).toList();
  }

  List<Widget> genItem(List<UserPage> pages) {
    return pages.map((page) {
      return CheckTile(page: page);
    }).toList();
  }
}

class CheckTile extends StatefulWidget {
  CheckTile({Key key,this.page}) : super(key: key);
  UserPage page;
  @override
  _CheckTileState createState() => _CheckTileState();
}

class _CheckTileState extends State<CheckTile> {
  var _checked=false;
  @override
  Widget build(BuildContext context) {
    return Container(
       child: CheckboxListTile(
         controlAffinity: ListTileControlAffinity.leading,
          value: _checked,
          title: Text(widget.page.title),
          onChanged: (value) {
            setState(() {
              _checked = value;
            });
          }),
    );
  }
}
/* InkWell(
            onTap: () => onTap(page),
            child: Text(page.title),
            splashColor: Colors.green,
          )
          */
