import 'package:flutter/material.dart';
import 'field_validator.dart';

class VouNo extends StatelessWidget {
  const VouNo({Key key, this.initialValue, this.onSaved, this.iconData})
      : super(key: key);
  final String initialValue;
  final FormFieldSetter<String> onSaved;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 180,
        child: TextFormField(
          initialValue: initialValue,
          validator: FieldValidator.vouNo,
          autovalidate: true,
          onSaved: onSaved,
          decoration: const InputDecoration(
            icon: Icon(Icons.receipt),
            labelText: '单号',
          ),
        ));
  }
}
