import 'package:flutter/material.dart';

import '../../models/index.dart';

//typedef TabCallBack = void Function(PageVo page);

class PageContent extends StatelessWidget {
  const PageContent({this.currentPageIndex,this.openPages});
  final int currentPageIndex;
  final List<UserPage> openPages;

  @override
  Widget build(BuildContext context) {
    return currentPageIndex == -1
    ? const Text('')
    : IndexedStack(
            index: currentPageIndex,
            children: openPages.map((UserPage page)=>page.widget).toList(),
        );
  }
}

