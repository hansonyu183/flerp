import 'package:flutter/material.dart';

import '../widgets/formButton/actionButton.dart';

class ActionBar extends StatelessWidget {
  ActionBar({this.actionButtons});

  final List<ActionButton> actionButtons;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: actionButtons,
    );
  }
}

