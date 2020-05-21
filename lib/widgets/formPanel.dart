import 'package:flutter/material.dart';

class FormPanel extends StatelessWidget {
  FormPanel({this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: children,
    );
  }
}
