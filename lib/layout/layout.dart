import 'package:flutter/material.dart';
import 'package:flerp/state.dart';
import './menu.dart';
import './pageTab.dart';
import './pageContent.dart';
class Layout extends StatelessWidget {
  Layout({Key key, this.appTitle}) : super(key: key);

  final String appTitle;

  @override
  Widget build(BuildContext context) {
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
    JsonMenu menu = JsonMenu(
      onTap: (String title,String pageName) => 
        gobalConsumer.setState((state) => state.openPage(PageVo(pageName,title,""))),
      onExpnd: ()=>gobalConsumer.setState((state) => state.expndMenu()),
    );

    Widget pageBar = gobalConsumer.build((ctx, state) {
      return PageTab(
        currentPageIndex:state.currentPageIndex,
        openPages: state.openPages,
        onTap: (PageVo page)=>gobalConsumer.setState((state) => state.loadPage(page)),
        onClose: (PageVo page)=>gobalConsumer.setState((state) => state.closePage(page))
        );},
      memo: (s) => [s.currentPageIndex],
    );

    Widget content= gobalConsumer.build((ctx, state) {
      return PageContent(
        currentPageIndex:state.currentPageIndex,
        openPages:state.openWidgets);},
      memo: (s) => [s.currentPageIndex]
    );

    Widget body = gobalConsumer.build((ctx, state) {
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