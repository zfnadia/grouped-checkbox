/*
Name: Nadia Ferdoush
Date: 08/01/2024
Copyright: © 2024, Nadia Ferdoush. All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:grouped_checkbox/grouped_checkbox.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grouped Checkbox Demo',
      home: MyHomePage(title: 'Grouped Checkbox Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ColorItem> allItemList = [
    ColorItem('Red', Colors.red),
    ColorItem('Green', Colors.green),
    ColorItem('Blue', Colors.blue),
    ColorItem('Yellow', Colors.yellow),
    ColorItem('Black', Colors.black),
    ColorItem('Violet', Colors.purple),
  ];

  List<ColorItem> selectedVerticalItems = [];
  List<ColorItem> selectedHorizontalItems = [];
  List<ColorItem> selectedWrapItems = [];

  @override
  void initState() {
    super.initState();
    selectedVerticalItems = [allItemList[2], allItemList[3]];
    selectedHorizontalItems = [allItemList[3], allItemList[4]];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title!, style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildCheckboxSection(
                'VERTICAL ORIENTATION EXAMPLE',
                CheckboxOrientation.vertical,
                selectedVerticalItems,
                updateVerticalItems,
                [allItemList[0]]),
            Divider(height: 2.0),
            buildCheckboxSection(
                'HORIZONTAL ORIENTATION EXAMPLE',
                CheckboxOrientation.horizontal,
                selectedHorizontalItems,
                updateHorizontalItems,
                [allItemList[1]]),
            Divider(height: 2.0),
            buildCheckboxSection(
                'WRAP ORIENTATION EXAMPLE',
                CheckboxOrientation.wrap,
                selectedWrapItems,
                updateWrapItems,
                [allItemList[2]]),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }

  void updateVerticalItems(List<ColorItem> newItems) {
    setState(() {
      selectedVerticalItems = newItems;
    });
  }

  void updateHorizontalItems(List<ColorItem> newItems) {
    setState(() {
      selectedHorizontalItems = newItems;
    });
  }

  void updateWrapItems(List<ColorItem> newItems) {
    setState(() {
      selectedWrapItems = newItems;
    });
  }

  Widget buildCheckboxSection(
      String title,
      CheckboxOrientation orientation,
      List<ColorItem> selectedItems,
      Function(List<ColorItem>) updateFunction,
      List<ColorItem> disabledItems) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: Colors.blue, fontSize: 15.0),
          ),
          GroupedCheckbox<ColorItem>(
            itemList: allItemList,
            checkedItemList: selectedItems,
            disabled: disabledItems,
            onChanged: (itemList) {
              updateFunction(itemList!);
            },
            orientation: orientation,
            checkColor: Colors.purpleAccent,
            activeColor: Colors.lightBlue,
            itemWidgetBuilder: (item) => Text(
              item.name,
              style: TextStyle(color: item.color),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            'Selected Colors: ${selectedItems.map((item) => item.name).join(', ')}',
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}

class ColorItem {
  String name;
  Color color;

  ColorItem(this.name, this.color);
}
