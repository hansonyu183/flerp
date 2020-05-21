import 'package:flutter/material.dart';


class LabelField extends StatelessWidget {
  const LabelField({Key key, this.label, this.initialValue, @required this.onSaved,this.iconData})
      : super(key: key);
  final String label; 
  final String initialValue;
  final FormFieldSetter<String> onSaved;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    onSaved(initialValue);
    return Container(
        width: 150,
        child:TextFormField(
          
      enabled: false,
      initialValue: initialValue,

      onSaved: onSaved,
      decoration: InputDecoration(
        icon: Icon(iconData),
        labelText: label,
      ),
    ));
  }
}
