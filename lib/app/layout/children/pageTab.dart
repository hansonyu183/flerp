import 'package:flutter/material.dart';

import '../../models/user_page.dart';

typedef TabCallBack = void Function(UserPage page);

class PageTab extends StatelessWidget {
  const PageTab({this.currentPageIndex, this.openPages, this.onTap, this.onClose});
  final int currentPageIndex;
  final List<UserPage> openPages;
  final TabCallBack onClose;
  final TabCallBack onTap;

  @override
  Widget build(BuildContext context) {
    return currentPageIndex == -1 ? const Text('') : genPageBar(openPages);
  }

  Widget genPageBar(List<UserPage> openPages) {
    int _selectIndex = -1;
    return Container(
        alignment: Alignment.topLeft,
        child: Wrap(
          children: openPages.map((UserPage page) {
            _selectIndex++;
            return RawChip(
              shape: Border(
                bottom: BorderSide(
                    color: _selectIndex == currentPageIndex
                        ? Colors.blue
                        : Colors.grey,
                    width: 2),
              ),
              backgroundColor: Colors.grey,
              showCheckmark: false,
              label: Text(page.title),
              onSelected: (bool v) => onTap(page),
              deleteIcon: const Icon(Icons.close),
              onDeleted: () => onClose(page),
            );
          }).toList(),
        ));
  }
}