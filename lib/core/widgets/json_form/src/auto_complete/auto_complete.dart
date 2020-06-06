import 'package:flutter/material.dart';

typedef FLAutoCompleteItemBuilder = Widget Function<T>(BuildContext context, T suggestion);

class FLAutoComplete<T> extends StatefulWidget {
    const FLAutoComplete(
      {Key key,
     // this.focusNode,
      this.onSelectedSuggestion,
      this.hideAfterSelection = true,
      this.hideWhenUnFocus = true,
      @required this.dataList,
      @required this.child})
      : assert(dataList != null),
        assert(child != null),
        super(key: key);

  /// must same as the child's focus node;
 // final FocusNode focusNode;

  final ValueChanged<T> onSelectedSuggestion;

  /// hide suggestions overlay automatically after select suggestion.
  /// default is true.
  final bool hideAfterSelection;

  /// hide suggestions overlay when focus node UnFocus.
  /// default is true.
  final bool hideWhenUnFocus;

  final List<T> dataList;

  /// complete widget, such as a TextField.
  final Widget child;



  @override
  State<FLAutoComplete<T>> createState() => FLAutoCompleteState<T>();
}

class FLAutoCompleteState<T> extends State<FLAutoComplete<T>> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry _suggestionsEntry;
  List<T> _suggestionList;
  bool _display = false;
/*
  @override
  void initState() {
    super.initState();
    //widget.focusNode?.addListener(_handleNodeUnFocus);
  }

  void _handleNodeUnFocus() {
    if (!widget.hideWhenUnFocus) return;

    if (widget.focusNode == null) return;

    if (!widget.focusNode.hasFocus) {
      hideAutoComplete();
    }
  }*/

  /// show suggestions overlay with data source.
  /// if suggestions is empty
  void updateSuggestionList(List<T> suggestions) {
    if (suggestions == null || suggestions.isEmpty) {
      hideAutoComplete();
      return;
    }

    _suggestionList = suggestions;
    if (_suggestionsEntry == null) {
      final Size childSize = (context.findRenderObject() as RenderBox).size;
      final double width = childSize.width;
      final double height = childSize.height;

      _suggestionsEntry = OverlayEntry(builder: (BuildContext context) {
        return Positioned(
          width: width,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(0.0, height),
            child: SizedBox(
              width: width,
              child: Card(
                color: Colors.grey,
                child: Column(
                  children: _suggestionList.map((T suggestion) {
                    return Row(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTapDown: (TapDownDetails v){
                              widget.onSelectedSuggestion?.call(suggestion);
                              if (widget.hideAfterSelection) {
                                hideAutoComplete();
                              }},
                            splashColor: Colors.green,
                            child: Text(suggestion.toString()),
                            /*如果无此回调，则不触发onTapDown,onTap回调晚于关联TextFormField的onEditingComplete,
                            如果在onEditingComplete中实现自动选择并关掉选择框，就无法触发onTap，onTapDown早于onEditingComplete
                            所以要在onTapDown关闭选择框*/
                            onTap: ()=>1,
                          ),
                        )
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        );
      });
      Overlay.of(context).insert(_suggestionsEntry);
      _display = true;
    } else {
      _suggestionsEntry.markNeedsBuild();
    }
  }

  void hideAutoComplete() {
    if (!_display) {
      return;
    }

    _suggestionsEntry.remove();
    _suggestionsEntry = null;
    _display = false;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(link: _layerLink, child: widget.child);
  }
}
