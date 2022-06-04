import 'package:flutter/cupertino.dart';

class Drink {
  final int id;
  final String drinkName;
  Color? color;

  Drink({required this.id, required this.drinkName});

  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(id: int.parse(json['idDrink']), drinkName: json['strDrink']);
  }

  static List<Drink> drinksFromJson(List json) {
    return json.map((json) => Drink.fromJson(json)).toList();
  }
}
