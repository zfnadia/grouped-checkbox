# Grouped Checkbox

[![pub package](https://img.shields.io/badge/pub-v0.0.1-blue)](https://pub.dartlang.org/packages/grouped_chechkbox)

A package to easily group checkboxes in different styles in Flutter projects.

<p>
    <img src="https://github.com/zfnadia/grouped_checkbox/master/screenshots/one.png?raw=true"/>
    <img src="https://github.com/zfnadia/grouped_checkbox/master/screenshots/two.png?raw=true"/>
    <img src="https://github.com/zfnadia/grouped_checkbox/master/screenshots/animated_gif.gif?raw=true"/>
</p>

## How to use

```dart
import 'package:grouped_checkbox/grouped_checkbox.dart';
```

```dart
    List<String> allItemList = [
        'Red',
        'Green',
        'Blue',
        'Yellow',
        'Black',
        'Violet',
      ];
    
    List<String> checkedItemList = ['Green', 'Yellow'];
      
    GroupedCheckbox(
      itemList: allItemList,
      checkedItemList: checkedItemList,
      disabled: ['Black'],
      onChanged: (itemList) {
        setState(() {
           selectedItemList = itemList;
           print('SELECTED ITEM LIST $itemList');
          });
      },
      orientation: CheckboxOrientation.VERTICAL,
      checkColor: Colors.lightGreenAccent,
      activeColor: Colors.red
    );
```
