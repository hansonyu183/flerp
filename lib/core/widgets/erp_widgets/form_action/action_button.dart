import 'package:flutter/material.dart';
class ActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconDate;
  final String tooltip;

  const ActionButton.preVou({this.iconDate=Icons.arrow_back,this.tooltip="前单",this.onPressed});
  const ActionButton.nextVou({this.iconDate=Icons.arrow_forward,this.tooltip="后单",this.onPressed});
  const ActionButton.print({this.iconDate=Icons.print,this.tooltip="打印",this.onPressed});
  const ActionButton.add({this.iconDate=Icons.add,this.tooltip="新增",this.onPressed});
  const ActionButton.save({this.iconDate=Icons.save,this.tooltip="保存",this.onPressed});
  const ActionButton.askCheck({this.iconDate=Icons.check,this.tooltip="送审",this.onPressed});
  const ActionButton.unAskCheck({this.iconDate=Icons.undo,this.tooltip="反送审",this.onPressed});
  const ActionButton.check({this.iconDate=Icons.check_circle_outline,this.tooltip="审核",this.onPressed});
  const ActionButton.unCheck({this.iconDate=Icons.undo,this.tooltip="反审核",this.onPressed});
  const ActionButton.finish({this.iconDate=Icons.check_circle,this.tooltip="完成",this.onPressed});
  const ActionButton.unFinish({this.iconDate=Icons.undo,this.tooltip="反完成",this.onPressed});
  const ActionButton.option({this.iconDate=Icons.settings,this.tooltip="选项",this.onPressed});
  const ActionButton.delete({this.iconDate=Icons.delete_forever,this.tooltip="删除",this.onPressed});
  @override
  Widget build(BuildContext context) {    
    return Row(children:[IconButton(
      //autofocus: true,
      tooltip: tooltip,
      icon: Icon(iconDate),
      onPressed: onPressed),
      Text(tooltip),
    ]);
  }
}

