import 'package:consumer/consumer.dart';
import 'package:flerp/models/index.dart';
import 'package:flerp/modules/app_modules.dart';
import 'package:flutter/material.dart';

class LayoutState {
  UserData userData;
  bool expandMenu=true;
  int currentPageIndex = 0;
  List<UserPage> openPages;//=["客户资料","商品资料","供应商资料"];
  List<Widget> openWidgets;

  LayoutState.test(){
    UserData _ud  =AppModules().defaultUserData;
    UserPage _firstPage = _ud.modules.last.pages.last;
    this.userData = _ud;
    this.openPages=[_firstPage];
    this.openWidgets=[_firstPage.buildWidget()];
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
          widgetList.add(page.buildWidget());
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

var layoutConsumer = Consumer(LayoutState.test());
