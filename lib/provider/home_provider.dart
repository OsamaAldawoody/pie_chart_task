import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart_task/models/drink.dart';
import 'dart:math' as math;

import '../api/_api.dart';
import '../api/get_it.dart';

class HomeProvider extends DisposableProvider {
  final DrinkAbstract _api = getIt<DrinkAbstract>();

  final colorList = <Color>[];
  List<Drink> drinksList = [];

  Map<String, double>? drinksPieChartMap;

  Future<void> getDrinksMapForPieChart() async {
    Map<String, double> drinksMap = {};
    for (var item in await _api.getDrinks()) {
      final Color color = generateDrinkColor();
      item.color = color;
      colorList.add(color);
      drinksList.add(item);
      drinksMap[item.drinkName] = item.id.toDouble();
    }
    drinksPieChartMap = drinksMap;
  }

  Color generateDrinkColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }

  @override
  void disposeValues() {
    colorList.clear();
    drinksList.clear();
    drinksPieChartMap!.clear();
  }
}

abstract class DisposableProvider with ChangeNotifier {
  void disposeValues();
}
