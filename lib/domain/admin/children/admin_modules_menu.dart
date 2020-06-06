import 'package:flutter/material.dart';
import 'package:flerp/app/models/index.dart';

class AdminModulesMenu extends StatefulWidget {
  const AdminModulesMenu({Key key, this.modules, this.onTap}) : super(key: key);
  final List<Module> modules;
  final void Function(UserPage) onTap;
  @override
  _AdminModulesMenuState createState() => _AdminModulesMenuState();
}

class _AdminModulesMenuState extends State<AdminModulesMenu> {
  @override
  Widget build(BuildContext context) {
    return widget.modules == null ? const Text('null') : genMenu(widget.modules);
  }

  ListView genMenu(List<Module> modules) {
    return ListView(children: genList(modules));
  }

  List<Widget> genList(List<Module> modules) {
    return modules.map((Module module) {
      List<Widget> pageMenu = <Widget>[];
      if (module.pages != null) {
        pageMenu = genItem(module.pages);
      }
      if (module.modules != null) {
        pageMenu.addAll(genList(module.modules));
      }
      return ExpansionTile(
        children: pageMenu,
        title: Text(module.name),
      );
    }).toList();
  }

  List<Widget> genItem(List<UserPage> pages) {
    return pages.map((UserPage page) {
      return CheckTile(page: page);
    }).toList();
  }
}

class CheckTile extends StatefulWidget {
  const CheckTile({Key key,this.page}) : super(key: key);
  final UserPage page;
  @override
  _CheckTileState createState() => _CheckTileState();
}

class _CheckTileState extends State<CheckTile> {
  bool _checked=false;
  @override
  Widget build(BuildContext context) {
    return Container(
       child: CheckboxListTile(
         controlAffinity: ListTileControlAffinity.leading,
          value: _checked,
          title: Text(widget.page.title),
          onChanged: (bool value) {
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
