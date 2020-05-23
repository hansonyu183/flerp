import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconDate;
  final String tooltip;

  const ActionButton.back({this.iconDate=Icons.arrow_back,this.tooltip="前单",this.onPressed});
  const ActionButton.forward({this.iconDate=Icons.arrow_forward,this.tooltip="后单",this.onPressed});
  const ActionButton.print({this.iconDate=Icons.print,this.tooltip="打印",this.onPressed});
  const ActionButton.add({this.iconDate=Icons.add,this.tooltip="新增",this.onPressed});
  const ActionButton.save({this.iconDate=Icons.save,this.tooltip="保存",this.onPressed});
  const ActionButton.check({this.iconDate=Icons.check_circle_outline,this.tooltip="审核",this.onPressed});
  @override
  Widget build(BuildContext context) {    
    return IconButton(
      autofocus: true,
      tooltip: tooltip,
      icon: Icon(iconDate),
      onPressed: onPressed,
    );
  }
}

