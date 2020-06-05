import 'package:flutter/material.dart';

import '../models/index.dart';
import 'children/index.dart';
import 'layout_vm.dart';

class Layout extends StatefulWidget {
  Layout({Key key, this.appTitle, this.onLogout, this.user})
      : super(key: key);

  final String appTitle;
  final VoidCallback onLogout;
  final User user;

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  bool expandMenu=true;
  var layoutVM ;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
        layoutVM = LayoutVM(context,widget.user);

    //layoutVm.initFirstPage(widget.userData.modules.last.pages.last);
    Widget menu = Menu(
      modules: widget.user.role.modules,
      onTap: (page) => layoutVM.openPage(page),
      onExpend: (){setState(() {
        expandMenu=!expandMenu;
      });}
    );

    Widget pageBar = layoutVM.build(
      (ctx, state) {
        return PageTab(
            currentPageIndex: state.currentPageIndex,
            openPages: state.openPages,
            onTap: ( page) =>
                layoutVM.loadPage(page),
            onClose: ( page) =>
                layoutVM.closePage(page));
      },
      memo: (s) => [s.currentPageIndex],
    );

    Widget content = layoutVM.build((ctx, state) {
      return PageContent(
          currentPageIndex: state.currentPageIndex,
          openPages: state.openPages);
    }, 
    memo: (s) => [s.currentPageIndex]
    );

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
                children: <Widget>[
                      pageBar, 
                      Expanded(child: content),
            // Expanded(child: content )
          ]),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:Text(widget.appTitle),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: widget.onLogout),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.settings),
        onPressed: () {
          //scaffoldStateKey.currentState.openEndDrawer();
        },
      ),
      bottomNavigationBar: menu,
      );
  }
}

