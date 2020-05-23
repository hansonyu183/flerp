import 'package:flutter/material.dart';
import './menu.dart';
import './pageTab.dart';
import './pageContent.dart';
import './state.dart';

import 'package:flerp/models/index.dart';
import 'package:flerp/modules/modules.dart';



class Layout extends StatelessWidget {
  Layout({Key key, this.appTitle}) : super(key: key);

  final String appTitle;

  @override
  Widget build(BuildContext context) {
    //List<UserPage> userPages = [UserPage(0,"test","test")]
    return Scaffold(
      backgroundColor: Colors.grey,
      body: LayoutBody(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(appTitle),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              //logout();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.settings),
        onPressed: () {
          //scaffoldStateKey.currentState.openEndDrawer();
        },
      ),
    );
  }
}

class LayoutBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserData userDate =Modules.defaultUserData();

    print(userDate.toJson());
    layoutConsumer.state.initState();

    JsonMenu menu = JsonMenu(
      userData: userDate,
      onTap: (page) => layoutConsumer.setState((state) => state.openPage(page)),
      onExpend: ()=>layoutConsumer.setState((state) => state.expndMenu()),
    );

    Widget pageBar = layoutConsumer.build((ctx, state) {
      return PageTab(
        currentPageIndex:state.currentPageIndex,
        openPages: state.openPages,
        onTap: (UserPage page)=>layoutConsumer.setState((state) => state.loadPage(page)),
        onClose: (UserPage page)=>layoutConsumer.setState((state) => state.closePage(page))
        );},
      memo: (s) => [s.currentPageIndex],
    );

    Widget content= layoutConsumer.build((ctx, state) {
      return PageContent(
        currentPageIndex:state.currentPageIndex,
        openPages:state.openWidgets);},
      memo: (s) => [s.currentPageIndex]
    );

    Widget body = layoutConsumer.build((ctx, state) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: state.expandMenu ? 300 : 60,
            child: Container(
              decoration: BoxDecoration(
               // color: Colors.black12,
              ),
              child: menu,
            ),
          ),
          Expanded(child: Column(children: <Widget>[
            pageBar,Expanded(child: content),
            // Expanded(child: content )              
          ]))
        ],
      );},
      memo: (s) => [s.expandMenu]
    );

    return body;
  }
}