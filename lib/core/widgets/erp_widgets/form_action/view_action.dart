import 'package:flutter/material.dart';
import 'action_button.dart';

class ViewAction extends StatelessWidget {
  const ViewAction({Key key,this.onAction}) : super(key: key);
  final VoidCallback onAction;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children:<Widget>[
          ActionButton.preVou(onPressed: onAction),
          ActionButton.nextVou(onPressed: onAction),   
          ActionButton.option(onPressed: onAction),       
          ActionButton.print(onPressed: onAction),
          ActionButton.add(onPressed: onAction),
      ]
    ));
  }
}