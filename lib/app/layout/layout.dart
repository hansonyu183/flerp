import 'package:flutter/material.dart';

import '../models/index.dart';
import 'children/index.dart';
import 'layout_vm.dart';

class Layout extends StatefulWidget {
  const Layout({Key key, this.appTitle, this.onLogout, this.user})
      : super(key: key);

  final String appTitle;
  final VoidCallback onLogout;
  final User user;

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  bool expandMenu=true;
  LayoutVM layoutVM ;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
        layoutVM = LayoutVM(context,widget.user);

    //layoutVm.initFirstPage(widget.userData.modules.last.pages.last);
    final Widget menu = Menu(
      modules: widget.user.role.modules,
      onTap: (UserPage page) => layoutVM.openPage(page),
      onExpend: (){setState(() {
        expandMenu=!expandMenu;
      });}
    );

    final Widget pageBar = layoutVM.build(
      (BuildContext ctx, LayoutM state) {
        return PageTab(
            currentPageIndex: state.currentPageIndex,
            openPages: state.openPages,
            onTap: ( UserPage page) =>
                layoutVM.loadPage(page),
            onClose: ( UserPage page) =>
                layoutVM.closePage(page));
      },
      memo: (LayoutM s) => <dynamic>[s.currentPageIndex],
    );

    final Widget content = layoutVM.build((BuildContext ctx, LayoutM state) {
      return PageContent(
          currentPageIndex: state.currentPageIndex,
          openPages: state.openPages);
    }, 
    memo: (LayoutM s) => <dynamic>[s.currentPageIndex]
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
          IconButton(icon: const Icon(Icons.exit_to_app), onPressed: widget.onLogout),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.settings),
        onPressed: () {
          //scaffoldStateKey.currentState.openEndDrawer();
        },
      ),
      bottomNavigationBar: menu,
      );
  }
}

