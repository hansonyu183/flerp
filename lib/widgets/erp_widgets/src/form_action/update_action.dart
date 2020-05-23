import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:consumer/consumer.dart';

import 'action_button.dart';

enum ActionEnum { notSaved, saved, askChecked, checked, finished }

class ActionState {
  int actionIndex;

  doAction() {
    if (actionIndex < ActionEnum.finished.index) actionIndex++;
  }

  undoAction() {
    if (actionIndex > 0) actionIndex--;
  }
}

var consumer = Consumer(ActionState());

class UpdateAction extends StatelessWidget {
  const UpdateAction({Key key, this.actionState, this.onAction})
      : super(key: key);
  final ActionEnum actionState;
  final VoidCallback onAction;

  void _onDoAction() {
    consumer.setState((state) => state.doAction());
  }

  void _onUndoAction() {
    consumer.setState((state) => state.undoAction());
  }

  List<Widget> _getActionButton(int actionStateIndex) {
    List<Widget> _actionButtons;
    //enum ActionEnum { notSaved, saved, askChecked, checked, finished }

    switch (actionStateIndex) {
      case 0: 
        _actionButtons = [ActionButton.save(onPressed: _onDoAction)];
        break;
      case 1:
        _actionButtons = [
          ActionButton.save(onPressed: ()=>1),
          //Text("保存"),
          ActionButton.askCheck(onPressed: _onDoAction),
          //Text("送审")
        ];
        break;
      case 2:
        _actionButtons = [
          ActionButton.unAskCheck(onPressed: _onUndoAction),
          //Text("反送审"),
          ActionButton.check(onPressed: _onDoAction),
          //Text("审核")
        ];
        break;
      case 3:
        _actionButtons = [
          ActionButton.unCheck(onPressed: _onUndoAction),
          //Text("反审核"),
          ActionButton.finish(onPressed: _onDoAction),
          //Text("完成")
        ];
        break;
      case 4:
        _actionButtons = [
          ActionButton.unFinish(onPressed: _onUndoAction),
          //Text("反完成"),
        ];
        break;
      default:
    }
    return _actionButtons;
  }

  @override
  Widget build(BuildContext context) {
    consumer.state.actionIndex=actionState.index;
    return Container(
      child:  consumer.build((ctx, state) {
        return Row(children:_getActionButton(state.actionIndex));
        },
      memo: (s) => [s.actionIndex]
    )
    );
  }
}
