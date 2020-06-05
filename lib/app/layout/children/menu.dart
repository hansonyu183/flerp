import 'package:flutter/material.dart';
import '../../models/index.dart';

typedef MenuCallBack = void Function(UserPage);

class Menu extends StatelessWidget {
  Menu({Key key, this.modules, this.onTap, this.onExpend}) : super(key: key);
  final List<Module> modules ;
  final MenuCallBack onTap; //声明函数对象
  final VoidCallback onExpend;
  
  @override
  Widget build(BuildContext context) {
    return modules == null ? Text("null") : Wrap(children:genList(modules),alignment: WrapAlignment.center);
  }
  List<PopupMenuButton> genList(List<Module> modules) {
    return modules.map((module) {
       return PopupMenuButton<UserPage>(
         icon: Icon(getIcon()),
         tooltip: module.name,
         onSelected: onTap,
         itemBuilder: (context) {
           return <PopupMenuEntry<UserPage>>[ ...genItem(module.pages)];
         },
        );
    }).toList();
  }
  
  List<PopupMenuItem<UserPage>> genItem(List<UserPage> pages) {
    return pages.map((page){
        return  PopupMenuItem(
        value: page,
        child: Text(page.title));
      }
    ).toList();
  }  
}