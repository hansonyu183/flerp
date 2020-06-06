import 'package:flutter/material.dart';

class PaginationBox extends StatelessWidget {
  const PaginationBox({
    @required this.pageIndex,
    @required this.pagesCount,
    @required this.onLeftButtonTap,
    @required this.onRightButtonTap,
  });

  final int pageIndex;
  final int pagesCount;
  final VoidCallback onLeftButtonTap;
  final VoidCallback onRightButtonTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: <Widget>[
          Material(
            type: MaterialType.circle,
            color: Colors.transparent,
            child: IconButton(
              icon: const Icon(Icons.arrow_left),
              onPressed: onLeftButtonTap,
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              'Page ${pageIndex + 1} of $pagesCount',
              textAlign: TextAlign.center,
            ),
          ),
          Material(
            type: MaterialType.circle,
            color: Colors.transparent,
            child: IconButton(
              icon: const Icon(Icons.arrow_right),
              onPressed: onRightButtonTap,
            ),
          ),
        ],
      ),
    );
  }
}
