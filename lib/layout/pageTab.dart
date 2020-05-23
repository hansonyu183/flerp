import 'package:flerp/models/user_page.dart';
import 'package:flutter/material.dart';

typedef TabCallBack = void Function(UserPage page);

class PageTab extends StatelessWidget {
  PageTab({this.currentPageIndex, this.openPages, this.onTap, this.onClose});
  final int currentPageIndex;
  final List<UserPage> openPages;
  final TabCallBack onClose;
  final TabCallBack onTap;

  @override
  Widget build(BuildContext context) {

    return currentPageIndex == -1
    ? Text("")
    : DefaultTabController(
        key: ValueKey(currentPageIndex),
        length: openPages.length,
        initialIndex: currentPageIndex,
        child: Row(children: <Widget>[genPageBar(openPages)]));
  }

  TabBar genPageBar(List<UserPage> openPages){
    return TabBar(
        onTap: (index) => onTap(openPages[index]),
        isScrollable: true,
        tabs: openPages.map<Tab>((UserPage page) {
          return Tab(
              child: Row(
            children: <Widget>[
              Text(page.title,style: TextStyle(color: Colors.black),),
              SizedBox(width: 3),
              InkWell(
                  child: Icon(Icons.close, size: 10),
                  onTap: () => onClose(page))
            ],
          ));
        }).toList());
  }
}
