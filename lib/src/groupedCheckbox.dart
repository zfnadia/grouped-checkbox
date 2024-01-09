import 'package:flutter/material.dart';

class GroupedCheckbox<T> extends StatefulWidget {
  /// The list of items to display as checkboxes.
  final List<T>? itemList;

  /// The list of items that are initially checked.
  final List<T>? checkedItemList;

  /// The list of items that should be disabled.
  final List<T>? disabled;

  /// The orientation of checkboxes - horizontal, vertical, or wrap.
  final CheckboxOrientation orientation;

  /// Callback function triggered when the checkbox state changes.
  final Function(List<T>?) onChanged;

  /// The color to use when the checkbox is checked.
  final Color? activeColor;

  /// The color to use for the check icon when the checkbox is checked.
  final Color? checkColor;

  /// If true, the checkbox's value can be true, false, or null.
  final bool tristate;

  /// Configures the minimum size of the tap target.
  final MaterialTapTargetSize? materialTapTargetSize;

  /// The color for the checkbox's Material when it has the input focus.
  final Color? focusColor;

  /// The color for the checkbox's Material when a pointer is hovering over it.
  final Color? hoverColor;

  /// The direction to use as the main axis in the wrap layout.
  final Axis wrapDirection;

  /// How the children within a run should be placed in the main axis in a wrap layout.
  final WrapAlignment wrapAlignment;

  /// How much space to place between children in a run in the main axis in a wrap layout.
  final double wrapSpacing;

  /// How the runs themselves should be placed in the cross axis in a wrap layout.
  final WrapAlignment wrapRunAlignment;

  /// How much space to place between the runs themselves in the cross axis in a wrap layout.
  final double wrapRunSpacing;

  /// How the children within a run should be aligned relative to each other in the cross axis in a wrap layout.
  final WrapCrossAlignment wrapCrossAxisAlignment;

  /// The direction in which text is read in the wrap layout.
  final TextDirection? wrapTextDirection;

  /// Determines the order to lay children out vertically and how to interpret start and end in the vertical direction in a wrap layout.
  final VerticalDirection wrapVerticalDirection;

  /// Function to create a custom widget for each item.
  final Widget Function(T) itemWidgetBuilder;

  /// The cursor for a mouse pointer when it enters or is hovering over the widget.
  final MouseCursor? mouseCursor;

  /// The color that fills the checkbox, in all MaterialStates.
  final MaterialStateProperty<Color?>? fillColor;

  /// The color for the checkbox's Material.
  final MaterialStateProperty<Color?>? overlayColor;

  /// The splash radius of the circular Material ink response.
  final double? splashRadius;

  /// Defines how compact the checkbox's layout will be.
  final VisualDensity? visualDensity;

  /// An optional focus node to use for requesting focus.
  final FocusNode? focusNode;

  /// True if the widget should be focused during build.
  final bool autofocus;

  /// The shape of the checkbox's Material.
  final OutlinedBorder? shape;

  /// The color and width of the checkbox's border.
  final BorderSide? side;

  /// True if this checkbox wants to show an error state.
  final bool isError;

  /// The semantic label for the checkbox that will be announced by screen readers.
  final String? semanticLabel;

  const GroupedCheckbox({
    Key? key,
    required this.itemList,
    required this.orientation,
    required this.onChanged,
    required this.itemWidgetBuilder,
    this.checkedItemList,
    this.disabled,
    this.activeColor,
    this.checkColor,
    this.focusColor,
    this.hoverColor,
    this.materialTapTargetSize,
    this.tristate = false,
    this.wrapDirection = Axis.horizontal,
    this.wrapAlignment = WrapAlignment.start,
    this.wrapSpacing = 0.0,
    this.wrapRunAlignment = WrapAlignment.start,
    this.wrapRunSpacing = 0.0,
    this.wrapCrossAxisAlignment = WrapCrossAlignment.start,
    this.wrapTextDirection,
    this.wrapVerticalDirection = VerticalDirection.down,
    this.mouseCursor,
    this.fillColor,
    this.overlayColor,
    this.splashRadius,
    this.visualDensity,
    this.focusNode,
    this.autofocus = false,
    this.shape,
    this.side,
    this.isError = false,
    this.semanticLabel,
  }) : super(key: key);

  @override
  State<GroupedCheckbox<T>> createState() => _GroupedCheckboxState<T>();
}

class _GroupedCheckboxState<T> extends State<GroupedCheckbox<T>> {
  List<T>? selectedListItems = [];

  @override
  void initState() {
    super.initState();
    if (widget.checkedItemList != null) {
      selectedListItems = List<T>.from(widget.checkedItemList!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return generateItems();
  }

  Widget generateItems() {
    List<Widget> widgetList =
        widget.itemList!.map((item) => buildItem(item)).toList();

    switch (widget.orientation) {
      case CheckboxOrientation.vertical:
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: widgetList),
        );
      case CheckboxOrientation.horizontal:
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: widgetList),
        );
      case CheckboxOrientation.wrap:
        return SingleChildScrollView(
          child: Wrap(
            spacing: widget.wrapSpacing,
            runSpacing: widget.wrapRunSpacing,
            textDirection: widget.wrapTextDirection,
            crossAxisAlignment: widget.wrapCrossAxisAlignment,
            verticalDirection: widget.wrapVerticalDirection,
            alignment: widget.wrapAlignment,
            direction: Axis.horizontal,
            runAlignment: widget.wrapRunAlignment,
            children: widgetList,
          ),
        );
    }
  }

  Widget buildItem(T item) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Checkbox(
            activeColor: widget.activeColor,
            checkColor: widget.checkColor,
            focusColor: widget.focusColor,
            hoverColor: widget.hoverColor,
            materialTapTargetSize: widget.materialTapTargetSize,
            value: selectedListItems!.contains(item),
            tristate: widget.tristate,
            onChanged:
                (widget.disabled != null && widget.disabled!.contains(item))
                    ? null
                    : (bool? selected) {
                        if (selected == true) {
                          selectedListItems!.add(item);
                        } else {
                          selectedListItems!.remove(item);
                        }
                        setState(() {});
                        widget.onChanged(selectedListItems);
                      },
            mouseCursor: widget.mouseCursor,
            fillColor: widget.fillColor,
            overlayColor: widget.overlayColor,
            splashRadius: widget.splashRadius,
            visualDensity: widget.visualDensity,
            focusNode: widget.focusNode,
            autofocus: widget.autofocus,
            shape: widget.shape,
            side: widget.side,
            isError: widget.isError,
            semanticLabel: widget.semanticLabel),
        widget.itemWidgetBuilder(item),
      ],
    );
  }
}

enum CheckboxOrientation { horizontal, vertical, wrap }
