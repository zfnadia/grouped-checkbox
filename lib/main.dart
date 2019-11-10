import 'package:flutter/material.dart';
import 'package:grouped_checkbox/src/checkboxOrientation.dart';
import 'package:grouped_checkbox/src/groupedCheckbox.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grouped Checkbox Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Grouped Checkbox Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> allItemList = [
    'Mary Barra',
    'Gail Koziara Boudreaux',
    'Ginni Rometty',
    'Marillyn Hewson',
    'Corie Barry	',
    'Safra A. Catz',
    'Phebe Novakovic',
    'Tricia Griffith',
    'Kathy Warden',
    'Lynn Good',
    'Michelle Gass',
    'Vicki Hollub',
    'Margaret M. Keane',
    'Christine Leahy',
    'Barbara Rentler',
    'Beth Ford',
    'Deanna M. Mulligan',
    'Anna Manning',
    'Mary Winston',
    'Jill Soltau',
    'Kathryn V. Marinello',
    'Mary Laschinger',
    'Teresa Rasmussen',
    'Penny Pennington',
    'Joey Wat',
    'Nadia Ferdoush',
    'Cindy Mi',
    'Sheri McCoy',
    'Heather Bresch',
    'Geisha Williams',
  ];

  List<String> checkedItemList = ['Mary Barra', 'Michelle Gass'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GroupedCheckbox(
        itemList: allItemList,
        checkedItemList: checkedItemList,
        onChanged: (itemList) {
          print('SELECTED ITEM LIST $itemList');
        },
        orientation: CheckboxOrientation.VERTICAL,
        checkColor: Colors.blueAccent,
        activeColor: Colors.purple,
      ),
    );
  }
}
