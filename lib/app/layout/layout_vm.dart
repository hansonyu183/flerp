import 'package:flutter/material.dart';
import '../models/index.dart';
import '../../core/view_models/view_model.dart';

class LayoutM {
  int currentPageIndex;
  User user;
  List<UserPage> openPages; //=["客户资料","商品资料","供应商资料"];

  LayoutM(this.user) {
    this.currentPageIndex=0;
    this.openPages = [this.user.firstPage];
  }
}

class LayoutVM extends ViewModel<LayoutM> {
  User user;
  
  LayoutVM(BuildContext context,this.user) : super(context,LayoutM(user));

  void closePage(UserPage page) {
    int idx =
        model.openPages.indexWhere((element) => element.name == page.name);
    if (idx != -1) {
      model.openPages.removeAt(idx);
      setState((s) {
        s.currentPageIndex = s.openPages.length - 1;
      });
    }
  }

  void openPage(UserPage page) {
    if (model.openPages.indexWhere((element) => element.name == page.name) !=
        -1) {
      loadPage(page);
    } else {
      model.openPages.add(page);
      setState((s) {
        model.currentPageIndex = model.openPages.length - 1;
      });
    }
  }

  void loadPage(UserPage page) {
    int idx =
        model.openPages.indexWhere((element) => element.name == page.name);
    if (idx != model.currentPageIndex && idx != -1) {
      setState((s) {
        model.currentPageIndex = idx;
      });
    }
  }
}
