import 'package:flutter/cupertino.dart';

class Cart with ChangeNotifier {
  Map<String, int> itemsMap = {};

  void addDrink(String drink) {
    if (itemsMap.containsKey(drink)) {
      itemsMap[drink] = itemsMap[drink]! + 1;
    } else {
      itemsMap[drink] = 1;
    }
    notifyListeners();
  }

  void removeDrink(String drink) {
    if (itemsMap[drink]! > 1) {
      itemsMap[drink] = itemsMap[drink]! - 1;
    } else {
      itemsMap.remove(drink);
    }
    notifyListeners();
  }

  bool isCartEmpty() {
    return itemsMap.isEmpty;
  }
}
