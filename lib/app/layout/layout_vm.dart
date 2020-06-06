import 'package:flutter/material.dart';

import '../../core/view_models/view_model.dart';
import '../models/index.dart';

class LayoutM {
    LayoutM(this.user) {
    currentPageIndex=0;
    openPages = <UserPage>[user.firstPage];
  }

  int currentPageIndex;
  User user;
  List<UserPage> openPages; //=["客户资料","商品资料","供应商资料"];

}

class LayoutVM extends ViewModel<LayoutM> {
  LayoutVM(BuildContext context,this.user) : super(context,LayoutM(user));

  User user;
  
  void closePage(UserPage page) {
    final int idx =
        model.openPages.indexWhere((UserPage element) => element.name == page.name);
    if (idx != -1) {
      model.openPages.removeAt(idx);
      setState((LayoutM s) {
        s.currentPageIndex = s.openPages.length - 1;
      });
    }
  }

  void openPage(UserPage page) {
    if (model.openPages.indexWhere((UserPage element) => element.name == page.name) !=
        -1) {
      loadPage(page);
    } else {
      model.openPages.add(page);
      setState((LayoutM s) {
        model.currentPageIndex = model.openPages.length - 1;
      });
    }
  }

  void loadPage(UserPage page) {
    final int idx =
        model.openPages.indexWhere((UserPage element) => element.name == page.name);
    if (idx != model.currentPageIndex && idx != -1) {
      setState((LayoutM s) {
        model.currentPageIndex = idx;
      });
    }
  }
}
