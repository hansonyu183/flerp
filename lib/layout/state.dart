import 'package:consumer/consumer.dart';
import 'package:flutter/material.dart';

import 'package:flerp/models/user_page.dart';

class LayoutState {
  bool expandMenu=true;
  int currentPageIndex = 0;
  List<UserPage> openPages;//=["客户资料","商品资料","供应商资料"];
  List<Widget> openWidgets;

void initState(){
  var firstPage = UserPage();
  firstPage.id=0;
  firstPage.name="testPage1";
  firstPage.title="页面1";
  openPages=[firstPage];
  openWidgets=[firstPage.widget];
}

void closePage(UserPage page) {
    int idx = openPages.indexWhere((element) =>  element.name==page.name);
    if (idx!=-1){
      List<UserPage> newList = [...openPages];
      newList.removeAt(idx);
      openPages=newList;

      List<Widget> widgetList = [...openWidgets];
      widgetList.removeAt(idx);
      openWidgets=widgetList;

      currentPageIndex=openPages.length-1;
    }
  }

  void openPage(UserPage page) {
      if (openPages.indexWhere((element) => element.name==page.name)!=-1){
        loadPage(page);
      } else  {
          List<UserPage> newList = [...openPages];
          newList.add(page);
          openPages=newList;

          List<Widget> widgetList = [...openWidgets];
          widgetList.add(page.widget);
          openWidgets=widgetList;

          currentPageIndex=openPages.length-1;
      }
  }

  void loadPage(UserPage page) {
      int idx =openPages.indexWhere((element) => element.name==page.name);
      if (idx!=currentPageIndex && idx!=-1){
        currentPageIndex=idx;
      }
  }

  void expndMenu(){
    expandMenu=!expandMenu;
  }

}

var layoutConsumer = Consumer(LayoutState());
