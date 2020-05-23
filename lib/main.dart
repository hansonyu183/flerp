import 'package:flutter/material.dart';
import 'layout/layout.dart';

void main() {
  runApp(MyApp());
  
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: '坤洋ERP',
      theme: ThemeData.light(),
      home: Layout(appTitle: '坤洋ERP'),
    );
  }
}
