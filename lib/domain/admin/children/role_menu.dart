import 'package:flutter/material.dart';
import 'package:flerp/app/models/index.dart';

class RoleMenu extends StatelessWidget {
  RoleMenu(
      {Key key, this.roles, this.selectIndex, this.onSelected, this.onDeleted})
      : super(key: key);
  final List<Role> roles;
  final int selectIndex;
  final void Function(int selectIndex) onSelected; //声明函数对象
  final void Function(int selectIndex) onDeleted; //声明函数对象
  @override
  Widget build(BuildContext context) {
    var itemIndex = -1;
    var items = roles.map((Role role) {
      itemIndex++;
      return RawChip(
          avatar: Icon(Icons.perm_identity),
          shape: Border(
            bottom: BorderSide(
                color: itemIndex == selectIndex ? Colors.blue : Colors.grey,
                width: 2),
          ),
          backgroundColor: Colors.grey,
          showCheckmark: false,
          label: role.name != null ? Text(role.name) : TextField(),
          onSelected: (v) => onSelected(selectIndex),
          deleteIcon: Icon(Icons.close),
          onDeleted: () => onDeleted(selectIndex));

      /*return InkWell(
          child: role.name != null 
            ? Text(role.name) 
            : TextField(),
          onTap: () => onTap(role));*/
    }).toList();

    return (roles == null || roles.length == 0)
        ? Text("")
        : Column(children: items);
  }
}

/*

  ListView genMenu(List<Role> roles) {
    List<Widget> menuBody = genList(modules);

    ListView menu = ListView(children: [

    ]);
    return ListView.builder(itemBuilder: ,);
  }

  List<Widget> genList(List<Role> modules) {
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
*/
