import 'package:consumer/consumer.dart';
import 'package:flutter/material.dart';

class ViewModel<T> {
  ViewModel(this.viewCtx,this.model) 
    :consumer= Consumer<T>(model);

  BuildContext viewCtx;
  T model;
  Consumer<T> consumer;

  Widget build(Widget Function(BuildContext ctx, T state) builder,
      {List<dynamic> Function(T s) memo}) {
    //Widget Function(BuildContext ctx, T state) List<dynamic> Function(T s),   { List<dynamic> Function(T s) memo}
    return consumer.build(builder, memo: memo);
  }

  T setState(dynamic Function(T) fn) {
    return consumer.setState(fn);
  }

  Future< bool> showConfirmDialog(String title, String content) {
   return showDialog<bool>(
        context: viewCtx,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              FlatButton(
                child: const Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: const Text('确认'),
                onPressed: () {
                  Navigator.of(context).pop(true);                  
                },
              ),
            ],
          );
        });
  }
}
