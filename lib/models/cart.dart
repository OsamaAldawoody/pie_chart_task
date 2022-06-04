class Cart {
  Map<String, int> itemsMap = {};

  void addDrink(String drink) {
    if (itemsMap.containsKey(drink)) {
      itemsMap[drink] = itemsMap[drink]! + 1;
    } else {
      itemsMap[drink] = 1;
    }
  }

  bool isCartEmpty() {
    return itemsMap.isEmpty;
  }
}
