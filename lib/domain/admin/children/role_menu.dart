import 'package:flutter/material.dart';
import 'package:flerp/app/models/index.dart';

class RoleMenu extends StatefulWidget {
  const RoleMenu(
      {Key key, this.roles, this.selectIndex, this.onSelected, this.onDeleted})
      : super(key: key);
  final List<Role> roles;
  final int selectIndex;
  final void Function(int selectIndex) onSelected; //声明函数对象
  final void Function(int selectIndex) onDeleted; 
  @override
  _RoleMenuState createState() => _RoleMenuState();
}

class _RoleMenuState extends State<RoleMenu> {
  @override
  Widget build(BuildContext context) {
    int itemIndex = -1;
    final List<RawChip> items = widget.roles.map((Role role) {
      itemIndex++;
      return RawChip(
          avatar: const Icon(Icons.perm_identity),
          shape: Border(
            bottom: BorderSide(
                color: itemIndex == widget.selectIndex ? Colors.blue : Colors.grey,
                width: 2),
          ),
          backgroundColor: Colors.grey,
          showCheckmark: false,
          label: role.name != null ? Text(role.name) : const TextField(),
          onSelected: (bool v) => widget.onSelected(widget.selectIndex),
          deleteIcon: const Icon(Icons.close),
          onDeleted: (){ widget.onDeleted(widget.selectIndex); });

      /*return InkWell(
          child: role.name != null 
            ? Text(role.name) 
            : TextField(),
          onTap: () => onTap(role));*/
    }).toList();

    if (widget.roles == null || widget.roles.isEmpty) {
      return const Text('');
    } else {
      return Column(children: items);
    }
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
