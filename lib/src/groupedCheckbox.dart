import 'package:flutter/material.dart';
import 'package:grouped_checkbox/src/checkboxOrientation.dart';

class GroupedCheckbox extends StatefulWidget {
  /// A list of string that describes each checkbox. Each item must be distinct.
  final List<String> itemList;

  /// A list of string which specifies automatically checked checkboxes.
  /// Every element must match an item from itemList.
  final List<String> checkedItemList;

  /// Specifies the orientation of the elements in itemList.
  final CheckboxOrientation orientation;

  /// Called when the value of the checkbox group changes.
  final Function onChanged;

  /// The color to use when this checkbox is checked.
  ///
  /// Defaults to [ThemeData.toggleableActiveColor].
  final Color activeColor;

  /// The color to use for the check icon when this checkbox is checked.
  ///
  /// Defaults to Color(0xFFFFFFFF)
  final Color checkColor;

  GroupedCheckbox(
      {@required this.itemList,
      @required this.orientation,
      this.onChanged,
      this.checkedItemList,
      this.activeColor,
      this.checkColor});

  @override
  _GroupedCheckboxState createState() => _GroupedCheckboxState();
}

class _GroupedCheckboxState extends State<GroupedCheckbox> {
  List<String> selectedListItems = List<String>();

  @override
  Widget build(BuildContext context) {
    Widget finalWidget = generateItems();
    return finalWidget;
  }

  Widget generateItems() {
    List<Widget> content = [];
    Widget finalWidget;
    if (widget.checkedItemList != null) {
      selectedListItems = widget.checkedItemList;
    }
    List<Widget> widgetList = List<Widget>();
    for (int i = 0; i < widget.itemList.length; i++) {
      widgetList.add(item(i));
    }
    if (widget.orientation == CheckboxOrientation.VERTICAL) {
      for (final item in widgetList) {
        content.add(Row(children: <Widget>[item]));
      }
      finalWidget = SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: content));
    } else if (widget.orientation == CheckboxOrientation.HORIZONTAL) {
      for (final item in widgetList) {
        content.add(Column(children: <Widget>[item]));
      }
      finalWidget = SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: content));
    } else {
      finalWidget = ListView(
        children: <Widget>[
          Wrap(
            children: widgetList,
            spacing: 20.0,
          )
        ],
      );
    }
    return finalWidget;
  }

  Widget item(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Checkbox(
            activeColor: widget.activeColor,
            checkColor: widget.checkColor,
            value: selectedListItems.contains(widget.itemList[index]),
            onChanged: (bool selected) {
              selected
                  ? selectedListItems.add(widget.itemList[index])
                  : selectedListItems.remove(widget.itemList[index]);
              setState(() {
                widget.onChanged(selectedListItems);
              });
            }),
        Text(widget.itemList[index].isEmpty ? '' : widget.itemList[index]),
      ],
    );
  }
}
