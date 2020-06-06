import 'package:flutter/material.dart';
import '../../models/index.dart';

typedef MenuCallBack = void Function(UserPage);

class Menu extends StatelessWidget {
  const Menu({Key key, this.modules, this.onTap, this.onExpend}) : super(key: key);
  final List<Module> modules ;
  final MenuCallBack onTap; //声明函数对象
  final VoidCallback onExpend;
  
  @override
  Widget build(BuildContext context) {
    return modules == null ? const Text('null') : Wrap(children:genList(modules),alignment: WrapAlignment.center);
  }
  List<PopupMenuButton<UserPage>> genList(List<Module> modules) {
    return modules.map((Module module) {
       return PopupMenuButton<UserPage>(
         icon: Icon(getIcon()),
         tooltip: module.name,
         onSelected: onTap,
         itemBuilder: (BuildContext context) {
           return <PopupMenuEntry<UserPage>>[ ...genItem(module.pages)];
         },
        );
    }).toList();
  }
  
  List<PopupMenuItem<UserPage>> genItem(List<UserPage> pages) {
    return pages.map((UserPage page){
        return  PopupMenuItem<UserPage>(
        value: page,
        child: Text(page.title));
      }
    ).toList();
  }  
}