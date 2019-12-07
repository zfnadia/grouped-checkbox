# Grouped Checkbox

[![pub package](https://img.shields.io/badge/pub-v0.0.1-blue)](https://pub.dartlang.org/packages/grouped_chechkbox)

A package to easily group checkboxes in different styles in Flutter projects.

<p>
    <img src="https://github.com/zfnadia/grouped_checkbox/blob/master/screenshots/one.png"/>
    <img src="https://github.com/zfnadia/grouped_checkbox/blob/master/screenshots/two.png"/>
    <img src="https://media.giphy.com/media/Y1do7LrbSxTOcQa5qF/giphy.gif"/>
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
