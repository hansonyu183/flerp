import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'action_button.dart';

enum ActionEnum { notSaved, saved, askChecked, checked, finished }

class UpdateAction extends StatefulWidget {
  const UpdateAction({Key key, this.actionState, this.onAction})
      : super(key: key);
  final ActionEnum actionState;
  final VoidCallback onAction;

  @override
  _UpdateActionState createState() => _UpdateActionState();
}

class _UpdateActionState extends State<UpdateAction> {
  int actionIndex;
  

  void _onDoAction() {
    if (actionIndex < ActionEnum.finished.index){
       setState(() {
          actionIndex++;
       });
    }
  }

  void _onUndoAction() {
    if (actionIndex > 0){
      setState(() {
        actionIndex--;
      });
    } 
  }

  void _onInitAction() {
    setState(() {
      actionIndex=0;
    });
  }

  List<Widget> _getActionButton(int actionStateIndex) {
    List<Widget> _actionButtons;
    //enum ActionEnum { notSaved, saved, askChecked, checked, finished }

    switch (actionStateIndex) {
      case 0: 
        _actionButtons = <Widget>[ActionButton.save(onPressed: _onDoAction)];
        break;
      case 1:
        _actionButtons = <Widget>[
          ActionButton.save(onPressed: ()=>1),
          ActionButton.askCheck(onPressed: _onDoAction),
          ActionButton.delete(onPressed: _onInitAction),
          //Text("送审")
        ];
        break;
      case 2:
        _actionButtons = <Widget>[
          ActionButton.unAskCheck(onPressed: _onUndoAction),
          //Text("反送审"),
          ActionButton.check(onPressed: _onDoAction),
          //Text("审核")
        ];
        break;
      case 3:
        _actionButtons = <Widget>[
          ActionButton.unCheck(onPressed: _onUndoAction),
          //Text("反审核"),
          ActionButton.finish(onPressed: _onDoAction),
          //Text("完成")
        ];
        break;
      case 4:
        _actionButtons = <Widget>[
          ActionButton.unFinish(onPressed: _onUndoAction),
          //Text("反完成"),
        ];
        break;
      default:
    }
    return _actionButtons;
  }

  @override
  void initState() {
    actionIndex=widget.actionState.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:   Row(children:_getActionButton(actionIndex))
    );
  }
}
