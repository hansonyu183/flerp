import 'package:consumer/consumer.dart';
import 'package:flutter/material.dart';

class ViewModel<T> {
  BuildContext viewCtx;
  T model;
  Consumer<T> consumer;
  ViewModel(BuildContext viewCtx,T model) {
    this.viewCtx=viewCtx;
    this.model = model;
    this.consumer = Consumer(this.model);
  }

  Widget build(Widget Function(BuildContext ctx, T state) builder,
      {List<dynamic> Function(T s) memo}) {
    //Widget Function(BuildContext ctx, T state) List<dynamic> Function(T s),   { List<dynamic> Function(T s) memo}
    return consumer.build(builder, memo: memo);
  }

  T setState(dynamic Function(T) fn) {
    return consumer.setState(fn);
  }

  bool showConfirmDialog(String title, String content) {
    bool confirmed;
    showDialog(
        context: viewCtx,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              FlatButton(
                child: Text('取消'),
                onPressed: () {
                  confirmed = false;
                  Navigator.of(context).pop('cancel');
                  
                },
              ),
              FlatButton(
                child: Text('确认'),
                onPressed: () {
                  confirmed = true;
                  Navigator.of(context).pop('ok');                  
                },
              ),
            ],
          );
        });
    return confirmed;
  }
}
