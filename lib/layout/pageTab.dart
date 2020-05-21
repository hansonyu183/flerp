import 'package:flutter/material.dart';
import 'package:flerp/state.dart';

typedef TabCallBack = void Function(PageVo page);

class PageTab extends StatelessWidget {
  PageTab({this.currentPageIndex, this.openPages, this.onTap, this.onClose});
  final int currentPageIndex;
  final List<PageVo> openPages;
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

  TabBar genPageBar(List<PageVo> openPages){
    return TabBar(
        onTap: (index) => onTap(openPages[index]),
        isScrollable: true,
        tabs: openPages.map<Tab>((PageVo page) {
          return Tab(
              child: Row(
            children: <Widget>[
              Text(page.title),
              SizedBox(width: 3),
              InkWell(
                  child: Icon(Icons.close, size: 10),
                  onTap: () => onClose(page))
            ],
          ));
        }).toList());
  }
}
