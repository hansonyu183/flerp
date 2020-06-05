import '../../models/index.dart';
import 'package:flutter/material.dart';

//typedef TabCallBack = void Function(PageVo page);

class PageContent extends StatelessWidget {
  PageContent({this.currentPageIndex,this.openPages});
  final int currentPageIndex;
  final List<UserPage> openPages;

  @override
  Widget build(BuildContext context) {
    return currentPageIndex == -1
    ? Text("")
    : IndexedStack(
            index: currentPageIndex,
            children: openPages.map((page)=>page.widget).toList(),
        );
  }
}

