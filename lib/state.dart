import 'package:consumer/consumer.dart';
import 'package:flutter/material.dart';
import 'package:flerp/module/base/eba/editor.dart';
import 'package:flerp/module/base/res/editor.dart';
import 'package:flerp/module/base/sup/editor.dart';
import 'package:flerp/module/testPage/testPage1.dart';

class PageVo{
  PageVo(this.name,this.title,this.model);
  String name;
  String title;
  String model;
}

class GlobalState {
  bool expandMenu=true;
  int currentPageIndex = 0;
  List<PageVo> openPages= [PageVo("testPage1","测试页","")];//=["客户资料","商品资料","供应商资料"];
  List<Widget> openWidgets=[TestPage1()];

  Widget makeWidget(PageVo currentPage){
    switch (currentPage.name) {
      case  "BaseEbaEditor":
        return BaseEbaEditor(json:currentPage.model);
      case  "BaseResEditor":
        return BaseResEditor(json:currentPage.model);
      case  "BaseSupEditor":
        return BaseSupEditor(json:currentPage.model);  
      case  "testPage1":
        return TestPage1();  
      default:
       return Text("404");
    }
  }

  void closePage(PageVo page) {
    int idx = openPages.indexWhere((element) =>  element.name==page.name);
    if (idx!=-1){
      List<PageVo> newList = [...openPages];
      newList.removeAt(idx);
      openPages=newList;

      List<Widget> widgetList = [...openWidgets];
      widgetList.removeAt(idx);
      openWidgets=widgetList;

      currentPageIndex=openPages.length-1;
    }
  }

  void openPage(PageVo page) {
      if (openPages.indexWhere((element) => element.name==page.name)!=-1){
        loadPage(page);
      } else  {
          List<PageVo> newList = [...openPages];
          newList.add(page);
          openPages=newList;

          List<Widget> widgetList = [...openWidgets];
          widgetList.add(makeWidget(page));
          openWidgets=widgetList;

          currentPageIndex=openPages.length-1;
      }
  }

  void loadPage(PageVo page) {
      int idx =openPages.indexWhere((element) => element.name==page.name);
      if (idx!=currentPageIndex && idx!=-1){
        currentPageIndex=idx;
      }
  }

  void expndMenu(){
    expandMenu=!expandMenu;
  }

  void storeModel(String pageName,String pageTitle,String pageModel){
    int idx =openPages.indexWhere((element) => element.name==pageName);
    if (idx==-1){
      openPages.add(PageVo(pageName,pageTitle,pageModel));
    }
    else{
      openPages[idx].model=pageModel;
    }
  }
}

var gobalConsumer = Consumer(GlobalState());
